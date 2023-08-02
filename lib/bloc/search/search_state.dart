import 'package:dartz/dartz.dart';
import 'package:movie_app/data/model/Anime/getAnimeSeach/GetAnimeSearch.dart';
import 'package:movie_app/data/model/getTop/Anime/Anime.dart';
import 'package:movie_app/data/model/getTop/recommendation/Recommendation.dart';

abstract class SearchState {}

class SearchLoadingState extends SearchState {}

class SearchInitState extends SearchState {}

class SearchSuccessResponse extends SearchState {
  Either<String, Recommendation> getRecom;
  Either<String, Anime> getUpcommingSeasons;

  SearchSuccessResponse(this.getRecom, this.getUpcommingSeasons);
}

class SearchResultState extends SearchState {
  Either<String, GetAnimeSearch> getSearchByWord;
  SearchResultState(this.getSearchByWord);
}
