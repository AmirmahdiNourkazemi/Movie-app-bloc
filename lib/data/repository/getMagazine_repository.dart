import 'package:dartz/dartz.dart';
import 'package:movie_app/data/datasource/getMagazine_datasource.dart';
import 'package:movie_app/data/model/Magazine/Magazine.dart';
import 'package:movie_app/di/di.dart';

import '../../utils/api_exeption.dart';

abstract class IgetMagazineRepository {
  Future<Either<String, Magazine>> getMagazine();
}

class GetMagazineRemote extends IgetMagazineRepository {
  @override
  final IgetMagazineDatasource _magazineDatasource = locator.get();
  Future<Either<String, Magazine>> getMagazine() async {
    try {
      var response = await _magazineDatasource.getMagazine();
      return right(response);
    } on ApiExeption catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
