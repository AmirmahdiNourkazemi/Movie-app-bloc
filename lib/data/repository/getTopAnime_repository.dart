import 'package:dartz/dartz.dart';
import 'package:movie_app/data/datasource/getTopAnime_datasource.dart';
import 'package:movie_app/data/model/Anime.dart';

import '../../di/di.dart';
import '../../utils/api_exeption.dart';
import '../model/Data.dart';

abstract class IgetTopAnimeRepository {
  Future<Either<String, Anime>> getTopAnime();
}

class GetTopAnimeRemote extends IgetTopAnimeRepository {
  @override
  final IgetTopAnimeDatasource _animeDatasource = locator.get();
  Future<Either<String, Anime>> getTopAnime() async {
    try {
      var response = await _animeDatasource.getTopAnime();
      return right(response);
    } on ApiExeption catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
