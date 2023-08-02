import 'package:dio/dio.dart';
import 'package:movie_app/data/model/Anime/getAnimeSeach/GetAnimeSearch.dart';

import '../../../di/di.dart';
import '../../../utils/api_exeption.dart';

abstract class ISearchFilterDatasource {
  Future<GetAnimeSearch> getAnimeByFilter(
      {String q = "", String order = "title", String rating = "g"});
}

class SearchFilterDatasource extends ISearchFilterDatasource {
  @override
  final Dio _dio = locator.get();

  @override
  Future<GetAnimeSearch> getAnimeByFilter(
      {String q = "", String order = "title", String rating = "g"}) async {
    final response = await _dio.get('anime?q=$q?order_b=$order?rating=$rating');
    try {
      return GetAnimeSearch.fromJson(response.data);
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.data['message'], ex.response?.statusCode);
    } catch (ex) {
      throw ApiExeption('unknown error happend', 0);
    }
  }
}
