import 'package:dartz/dartz.dart';
import 'package:movie_app/data/model/Anime.dart';

import '../../data/model/Data.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class ResponseSuccessState extends HomeState {
  Either<String, Anime> TopAnimeBanner;
  Either<String, Anime> TopAnime;
  Either<String, Anime> SeasonNow;
  ResponseSuccessState(this.TopAnimeBanner, this.TopAnime, this.SeasonNow);
}
