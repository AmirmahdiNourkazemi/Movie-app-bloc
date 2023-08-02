import 'package:dartz/dartz.dart';
import 'package:movie_app/data/model/Anime/getAnimeSeach/GetAnimeSearch.dart';

abstract class SearchFilterState {}

class SearchInitState extends SearchFilterState {}

class SearchLoadingState extends SearchFilterState {}

class ResponseSearchFilterState extends SearchFilterState {
  Either<String, GetAnimeSearch> getSearchFilter;
  ResponseSearchFilterState(this.getSearchFilter);
}
