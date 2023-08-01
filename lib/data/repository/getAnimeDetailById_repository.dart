import 'package:dartz/dartz.dart';
import 'package:movie_app/data/datasource/getAnimeDetailById_datasource.dart';
import 'package:movie_app/data/model/Anime/AnimeNews/AnimeNews.dart';
import 'package:movie_app/data/model/Anime/GetAnimeFullById/GetAnimeFullById.dart';
import 'package:movie_app/data/model/Anime/getAnimeCharacterById/GetAnimeCharacterById.dart';
import 'package:movie_app/data/model/Anime/getAnimeRecommendation/GetAnimeRecommendation.dart';
import '../../di/di.dart';
import '../../utils/api_exeption.dart';
import '../datasource/TopDatasources/getTopAnime_datasource.dart';
import '../model/Anime/getAnimeEpisodes/GetAnimeEpisodes.dart';
import '../model/getTop/Anime/Anime.dart';

abstract class IgetAnimeDetailByIdRepository {
  Future<Either<String, GetAnimeCharacterById>> getAnimeCharacterById(
      int malId);
  //Future<Either<String, GetAnimeEpisodes>> getAnimeEpisodesById(
  //  int malId, int episodes);
  Future<Either<String, AnimeNews>> getAnimeNewsById(int malId);
  Future<Either<String, GetAnimeRecommendation>> getAnimeRecommendationById(
      int malId);
  Future<Either<String, GetAnimeFullById>> getAnimeFullById(int malId);
}

class GetAnimeDetailByIdRemote extends IgetAnimeDetailByIdRepository {
  @override
  final IgetAnimeDetailsDatasource _animeDetailsDatasource = locator.get();

  Future<Either<String, GetAnimeCharacterById>> getAnimeCharacterById(
      int malId) async {
    try {
      var response = await _animeDetailsDatasource.getAnimeCharacterById(malId);
      return right(response);
    } on ApiExeption catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  // Future<Either<String, GetAnimeEpisodes>> getAnimeEpisodesById(
  //     int malId, int episodes) async {
  //   try {
  //     var response =
  //         await _animeDetailsDatasource.getAnimeEpisodesById(malId, episodes);
  //     return right(response);
  //   } on ApiExeption catch (e) {
  //     return left(e.message ?? 'خطا محتوای متنی ندارد');
  //   }
  // }

  @override
  Future<Either<String, AnimeNews>> getAnimeNewsById(int malId) async {
    try {
      var response = await _animeDetailsDatasource.getAnimeNewsById(malId);
      return right(response);
    } on ApiExeption catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, GetAnimeRecommendation>> getAnimeRecommendationById(
      int malId) async {
    try {
      var response =
          await _animeDetailsDatasource.getAnimeRecommendationById(malId);
      return right(response);
    } on ApiExeption catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, GetAnimeFullById>> getAnimeFullById(int malId) async {
    try {
      var response = await _animeDetailsDatasource.getAnimeFullByID(malId);
      return right(response);
    } on ApiExeption catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
