import 'package:dartz/dartz.dart';
import 'package:movie_app/data/model/getTop/Character/Character.dart';

import '../../data/model/getTop/Anime/Anime.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class ResponseSuccessState extends HomeState {
  Either<String, Anime> TopAnimeBanner;
  Either<String, Anime> TopAnime;
  Either<String, Anime> SeasonNow;
  Either<String, Character> TopCharacters;
  ResponseSuccessState(
      this.TopAnimeBanner, this.TopAnime, this.SeasonNow, this.TopCharacters);
}
