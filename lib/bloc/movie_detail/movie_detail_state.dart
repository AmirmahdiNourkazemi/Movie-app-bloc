import 'package:dartz/dartz.dart';
import 'package:movie_app/data/model/Anime/getAnimeCharacterById/GetAnimeCharacterById.dart';

import '../../data/model/Anime/getAnimeCharacterById/Character.dart';

abstract class MovieDetailState {}

class MovieDetialLoadingState extends MovieDetailState {}

class MovieDetailResponseSuccessState extends MovieDetailState {
  Either<String, GetAnimeCharacterById> movieDetailById;
  MovieDetailResponseSuccessState(this.movieDetailById);
}
