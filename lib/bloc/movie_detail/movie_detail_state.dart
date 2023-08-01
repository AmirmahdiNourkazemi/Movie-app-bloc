import 'package:dartz/dartz.dart';
import 'package:movie_app/data/model/Anime/AnimeNews/AnimeNews.dart';
import 'package:movie_app/data/model/Anime/getAnimeCharacterById/GetAnimeCharacterById.dart';
import 'package:movie_app/data/model/Anime/getAnimeEpisodes/GetAnimeEpisodes.dart';
import 'package:movie_app/data/model/Anime/getAnimeRecommendation/GetAnimeRecommendation.dart';

import '../../data/model/Anime/getAnimeCharacterById/Character.dart';

abstract class MovieDetailState {}

class MovieDetialLoadingState extends MovieDetailState {}

class MovieDetailResponseSuccessState extends MovieDetailState {
  Either<String, GetAnimeCharacterById> getAnimeCharactesById;
  Either<String, GetAnimeEpisodes> getAnimeEpisodes;
  Either<String, AnimeNews> getAnimeNews;
  Either<String, GetAnimeRecommendation> getAnimeRecommendation;
  MovieDetailResponseSuccessState(this.getAnimeCharactesById,
      this.getAnimeEpisodes, this.getAnimeNews, this.getAnimeRecommendation);
}
