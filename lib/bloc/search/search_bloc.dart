import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:movie_app/bloc/search/search_event.dart';
import 'package:movie_app/bloc/search/search_state.dart';
import 'package:movie_app/data/repository/getRecommendation_repository.dart';
import 'package:movie_app/di/di.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IgetRecomRepository _igetRecomRepository = locator.get();
  SearchBloc() : super(SearchInitState()) {
    on<SearchInitEvent>(
      (event, emit) async {
        emit(SearchLoadingState());
        var getRecom = await _igetRecomRepository.getRecome();
        emit(SearchSuccessResponse(getRecom));
      },
    );
  }
}
