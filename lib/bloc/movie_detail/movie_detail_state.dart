import 'package:dartz/dartz.dart';
import 'package:movie_app/data/model/Anime/getAnimeCharacterById/GetAnimeCharacterById.dart';
import 'package:movie_app/data/model/Anime/getAnimeEpisodes/GetAnimeEpisodes.dart';

import '../../data/model/Anime/getAnimeCharacterById/Character.dart';

abstract class MovieDetailState {}

class MovieDetialLoadingState extends MovieDetailState {}

class MovieDetailResponseSuccessState extends MovieDetailState {
  Either<String, GetAnimeCharacterById> getAnimeCharactesById;
  Either<String, GetAnimeEpisodes> getAnimeEpisodes;
  MovieDetailResponseSuccessState(
      this.getAnimeCharactesById, this.getAnimeEpisodes);
}