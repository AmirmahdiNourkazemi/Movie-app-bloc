import 'package:dio/dio.dart';
import 'package:movie_app/data/model/recommendation/Recommendation.dart';

import '../../di/di.dart';
import '../../utils/api_exeption.dart';

abstract class IgetRecomDatasource {
  Future<Recommendation> getRecom();
}

class GetRecomDatasource extends IgetRecomDatasource {
  @override
  final Dio _dio = locator.get();
  Future<Recommendation> getRecom() async {
    final response = await _dio.get('recommendations/anime');
    try {
      return Recommendation.fromJson(response.data);
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.data['message'], ex.response?.statusCode);
    } catch (ex) {
      throw ApiExeption('unknown error happend', 0);
    }
  }
}
