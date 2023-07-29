import 'package:dartz/dartz.dart';
import 'package:movie_app/data/datasource/getTopAnime_datasource.dart';
import '../../di/di.dart';
import '../../utils/api_exeption.dart';
import '../model/Anime/Anime.dart';

abstract class IgetTopAnimeRepository {
  Future<Either<String, Anime>> getTopAnimeBanner();
  Future<Either<String, Anime>> getTopAnime();
  Future<Either<String, Anime>> getUpcommingSeasons();
}

class GetTopAnimeRemote extends IgetTopAnimeRepository {
  @override
  final IgetTopAnimeDatasource _animeDatasource = locator.get();

  Future<Either<String, Anime>> getTopAnimeBanner() async {
    try {
      var response = await _animeDatasource.getTopAnimeBanner();
      return right(response);
    } on ApiExeption catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, Anime>> getTopAnime() async {
    try {
      var response = await _animeDatasource.getTopAnime();
      return right(response);
    } on ApiExeption catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, Anime>> getUpcommingSeasons() async {
    try {
      var response = await _animeDatasource.getUpcommingSeasons();
      return right(response);
    } on ApiExeption catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
