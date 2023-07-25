import 'package:dio/dio.dart';

import '../../di/di.dart';
import '../../utils/api_exeption.dart';
import '../model/Anime/Anime.dart';

abstract class IgetSeasonsDatasource {
  Future<Anime> getSeasonNow();
}

class GetSeasonNowDatasource extends IgetSeasonsDatasource {
  @override
  final Dio _dio = locator.get();
  Future<Anime> getSeasonNow() async {
    final response = await _dio.get('seasons/now');
    try {
      return Anime.fromJson(response.data);
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.data['message'], ex.response?.statusCode);
    } catch (ex) {
      throw ApiExeption('unknown error happend', 0);
    }
  }
}
