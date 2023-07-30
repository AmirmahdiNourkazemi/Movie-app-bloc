import 'package:dartz/dartz.dart';
import 'package:movie_app/data/datasource/getTopCharacter_datasource.dart';
import 'package:movie_app/data/model/Character/Character.dart';
import 'package:movie_app/di/di.dart';

import '../../utils/api_exeption.dart';

abstract class IgetCharacterRepository {
  Future<Either<String, Character>> getTopCharacter();
  Future<Either<String, Character>> getCharacterById(String mal_id);
}

class GetCharacterRemote extends IgetCharacterRepository {
  @override
  final IgetCharacterDatasource _characterDatasource = locator.get();
  Future<Either<String, Character>> getTopCharacter() async {
    try {
      var response = await _characterDatasource.getTopCharacter();
      return right(response);
    } on ApiExeption catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, Character>> getCharacterById(String mal_id) async {
    try {
      var response = await _characterDatasource.getCharacterById(mal_id);
      return right(response);
    } on ApiExeption catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
