import 'package:dio/dio.dart';
import 'package:movie_app/data/model/Magazine/Magazine.dart';

import '../../di/di.dart';
import '../../utils/api_exeption.dart';

abstract class IgetMagazineDatasource {
  Future<Magazine> getMagazine();
}

class GetMagazineDatasource extends IgetMagazineDatasource {
  @override
  Future<Magazine> getMagazine() async {
    final Dio _dio = locator.get();
    final response = await _dio.get('top/characters');
    try {
      return Magazine.fromJson(response.data);
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.data['message'], ex.response?.statusCode);
    } catch (ex) {
      throw ApiExeption('unknown error happend', 0);
    }
  }
}
