import 'package:dartz/dartz.dart';
import 'package:movie_app/data/model/recommendation/Recommendation.dart';

abstract class SearchState {}

class SearchLoadingState extends SearchState {}

class SearchInitState extends SearchState {}

class SearchSuccessResponse extends SearchState {
  Either<String, Recommendation> getRecom;
  SearchSuccessResponse(this.getRecom);
}