import 'package:dio/dio.dart';
import 'package:movie_app/data/model/Anime.dart';

import '../../di/di.dart';
import '../../utils/api_exeption.dart';
import '../model/Data.dart';

abstract class IgetTopAnimeDatasource {
  Future<Anime> getTopAnimeBanner();
  Future<Anime> getTopAnime();
}

class GetTopAnimeDatasource extends IgetTopAnimeDatasource {
  final Dio _dio = locator.get();

  Future<Anime> getTopAnimeBanner() async {
    final response = await _dio.get('top/anime');
    try {
      return Anime.fromJson(response.data);
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.data['message'], ex.response?.statusCode);
    } catch (ex) {
      throw ApiExeption('unknown error happend', 0);
    }
  }

  @override
  Future<Anime> getTopAnime() async {
    Map<String, String> qparams = {'page': '2'};
    final response = await _dio.get('top/anime', queryParameters: qparams);
    try {
      return Anime.fromJson(response.data);
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.data['message'], ex.response?.statusCode);
    } catch (ex) {
      throw ApiExeption('unknown error happend', 0);
    }
  }
}
