import 'package:dio/dio.dart';
import 'package:movie_app/data/model/Anime/getAnimeSeach/GetAnimeSearch.dart';

import '../../../di/di.dart';
import '../../../utils/api_exeption.dart';

abstract class IsearchDatasource {
  Future<GetAnimeSearch> getAnimeSearch(String word);
}

class SearchDatasouce extends IsearchDatasource {
  @override
  final Dio _dio = locator.get();
  Future<GetAnimeSearch> getAnimeSearch(String word) async {
    Map<String, String> qparams = {'q': '$word'};
    final response = await _dio.get('anime/', queryParameters: qparams);
    try {
      return GetAnimeSearch.fromJson(response.data);
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.data['message'], ex.response?.statusCode);
    } catch (ex) {
      throw ApiExeption('unknown error happend', 0);
    }
  }
}
