import 'package:dartz/dartz.dart';
import 'package:movie_app/data/datasource/getAnimeDetailById_datasource.dart';
import 'package:movie_app/data/model/Anime/getAnimeCharacterById/GetAnimeCharacterById.dart';
import '../../di/di.dart';
import '../../utils/api_exeption.dart';
import '../datasource/TopDatasources/getTopAnime_datasource.dart';
import '../model/getTop/Anime/Anime.dart';

abstract class IgetAnimeDetailByIdRepository {
  Future<Either<String, GetAnimeCharacterById>> getAnimeCharacterById(
      int mal_id);
}

class GetAnimeDetailByIdRemote extends IgetAnimeDetailByIdRepository {
  @override
  final IgetAnimeDetailsDatasource _animeDetailsDatasource = locator.get();

  Future<Either<String, GetAnimeCharacterById>> getAnimeCharacterById(
      int mal_id) async {
    try {
      var response =
          await _animeDetailsDatasource.getAnimeCharacterById(mal_id);
      return right(response);
    } on ApiExeption catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
