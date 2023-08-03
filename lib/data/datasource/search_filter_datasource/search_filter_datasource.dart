import 'package:dio/dio.dart';
import 'package:movie_app/data/model/Anime/getAnimeSeach/GetAnimeSearch.dart';

import '../../../di/di.dart';
import '../../../utils/api_exeption.dart';

abstract class ISearchFilterDatasource {
  Future<GetAnimeSearch> getAnimeByFilter(
      {String q = "", String order = "title", String rating = "G"});
}

class SearchFilterDatasource extends ISearchFilterDatasource {
  @override
  final Dio _dio = locator.get();

  @override
  Future<GetAnimeSearch> getAnimeByFilter(
      {String q = '', String order = "title", String rating = "G"}) async {
    // Response response = await _dio.get('anime',
    //     queryParameters: {'q': q, 'order_by': order, 'rating': rating});
    // if (response.statusCode == 200) {
    //   return GetAnimeSearch.fromJson(response.data);
    // } else {
    //   throw Exception();
    // }

    try {
      var defaultQueryParameter = {
        'q': '',
        'order': 'title',
        'rating': 'G',
        'sort': 'asc'
      };
      _dio.options.queryParameters = defaultQueryParameter;
      final response = await _dio.get(
        'anime',
        queryParameters: {'q': q, 'order_by': order, 'rating': rating},
      );

      return GetAnimeSearch.fromJson(response.data);
    } on DioError catch (ex) {
      if (ex.response != null &&
          ex.response!.data != null &&
          ex.response!.data['message'] != null) {
        throw ApiExeption(
            ex.response!.data['message'], ex.response!.statusCode);
      } else {
        throw ApiExeption('Unknown error happened', 0);
      }
    } catch (ex) {
      throw ApiExeption('Unknown error happened', 0);
    }
  }
}
