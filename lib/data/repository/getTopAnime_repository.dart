import 'package:dartz/dartz.dart';
import '../../di/di.dart';
import '../../utils/api_exeption.dart';
import '../datasource/TopDatasources/getTopAnime_datasource.dart';
import '../model/getTop/Anime/Anime.dart';

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
