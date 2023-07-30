import 'package:dio/dio.dart';
import 'package:movie_app/data/model/Character/Character.dart';

import '../../di/di.dart';
import '../../utils/api_exeption.dart';

abstract class IgetCharacterDatasource {
  Future<Character> getTopCharacter();
  Future<Character> getCharacterById(String mal_id);
}

class GetCharacterDatasource extends IgetCharacterDatasource {
  @override
  Future<Character> getTopCharacter() async {
    final Dio _dio = locator.get();
    final response = await _dio.get('top/characters');
    try {
      return Character.fromJson(response.data);
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.data['message'], ex.response?.statusCode);
    } catch (ex) {
      throw ApiExeption('unknown error happend', 0);
    }
  }

  @override
  Future<Character> getCharacterById(String mal_id) async {
    final Dio _dio = locator.get();
    final response = await _dio.get('anime/$mal_id/characters');
    try {
      return Character.fromJson(response.data);
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.data['message'], ex.response?.statusCode);
    } catch (ex) {
      throw ApiExeption('unknown error happend', 0);
    }
  }
}
