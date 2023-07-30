import 'package:dartz/dartz.dart';
import 'package:movie_app/data/model/Character/Character.dart';

abstract class MovieDetailState {}

class MovieDetialLoadingState extends MovieDetailState {}

class MovieDetailResponseSuccessState extends MovieDetailState {
  Either<String, Character> movieDetailById;
  MovieDetailResponseSuccessState(this.movieDetailById);
}
