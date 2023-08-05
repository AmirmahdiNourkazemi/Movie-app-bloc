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
    Response response = await _dio.get('anime', queryParameters: {'q': word});
    if (response.statusCode == 200) {
      return GetAnimeSearch.fromJson(response.data);
    } else {
      throw Exception();
    }
  }
}
