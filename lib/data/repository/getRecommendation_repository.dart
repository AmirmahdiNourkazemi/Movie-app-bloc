import 'package:dartz/dartz.dart';
import 'package:movie_app/data/model/getTop/recommendation/Recommendation.dart';
import 'package:movie_app/di/di.dart';

import '../../utils/api_exeption.dart';
import '../datasource/TopDatasources/getRecommendation_datasource.dart';

abstract class IgetRecomRepository {
  Future<Either<String, Recommendation>> getRecome();
}

class GetRecomRemote extends IgetRecomRepository {
  @override
  final IgetRecomDatasource _datasource = locator.get();
  Future<Either<String, Recommendation>> getRecome() async {
    try {
      var response = await _datasource.getRecom();
      return right(response);
    } on ApiExeption catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
