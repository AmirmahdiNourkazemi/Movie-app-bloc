import 'package:dio/dio.dart';
import 'package:movie_app/data/model/Anime/AnimeNews/AnimeNews.dart';
import 'package:movie_app/data/model/Anime/GetAnimeFullById/GetAnimeFullById.dart';
import 'package:movie_app/data/model/Anime/getAnimeCharacterById/GetAnimeCharacterById.dart';
import 'package:movie_app/data/model/Anime/getAnimeRecommendation/GetAnimeRecommendation.dart';

import '../../di/di.dart';
import '../../utils/api_exeption.dart';
import '../model/Anime/getAnimeEpisodes/GetAnimeEpisodes.dart';

abstract class IgetAnimeDetailsDatasource {
  Future<GetAnimeCharacterById> getAnimeCharacterById(int malId);
  //Future<GetAnimeEpisodes> getAnimeEpisodesById(int malId, int episodes);
  Future<AnimeNews> getAnimeNewsById(int malId);
  Future<GetAnimeRecommendation> getAnimeRecommendationById(int malId);
  Future<GetAnimeFullById> getAnimeFullByID(int malId);
}

class GetAnimeDetailsDatasource extends IgetAnimeDetailsDatasource {
  @override
  final Dio _dio = locator.get();
  Future<GetAnimeCharacterById> getAnimeCharacterById(int malId) async {
    final response = await _dio.get('anime/$malId/characters');
    try {
      return GetAnimeCharacterById.fromJson(response.data);
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.data['message'], ex.response?.statusCode);
    } catch (ex) {
      throw ApiExeption('unknown error happend', 0);
    }
  }

  @override
  // Future<GetAnimeEpisodes> getAnimeEpisodesById(int malId, int episodes) async {
  //   final response = await _dio.get('anime/$malId/episodes/$episodes');

  //   try {
  //     return GetAnimeEpisodes.fromJson(response.data);
  //   } on DioError catch (ex) {
  //     throw ApiExeption(ex.response?.data['message'], ex.response?.statusCode);
  //   } catch (ex) {
  //     throw ApiExeption('unknown error happend', 0);
  //   }
  // }

  @override
  Future<AnimeNews> getAnimeNewsById(int malId) async {
    final response = await _dio.get('anime/$malId/news');

    try {
      return AnimeNews.fromJson(response.data);
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.data['message'], ex.response?.statusCode);
    } catch (ex) {
      throw ApiExeption('unknown error happend', 0);
    }
  }

  @override
  Future<GetAnimeRecommendation> getAnimeRecommendationById(int malId) async {
    final response = await _dio.get('anime/$malId/recommendations');
    try {
      return GetAnimeRecommendation.fromJson(response.data);
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.data['message'], ex.response?.statusCode);
    } catch (ex) {
      throw ApiExeption('unknown error happend', 0);
    }
  }

  @override
  Future<GetAnimeFullById> getAnimeFullByID(int malId) async {
    final response = await _dio.get('anime/$malId/full');
    try {
      return GetAnimeFullById.fromJson(response.data);
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.data['message'], ex.response?.statusCode);
    } catch (ex) {
      throw ApiExeption('unknown error happend', 0);
    }
  }
}
