import 'package:dio/dio.dart';
import 'package:movie_app/data/model/getTop/Character/Character.dart';

import '../../../di/di.dart';
import '../../../utils/api_exeption.dart';

abstract class IgetCharacterDatasource {
  Future<Character> getTopCharacter();
  Future<Character> getCharacterById(int mal_id);
}

class GetCharacterDatasource extends IgetCharacterDatasource {
  final Dio _dio = locator.get();
  @override
  Future<Character> getTopCharacter() async {
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
  Future<Character> getCharacterById(int mal_id) async {
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
