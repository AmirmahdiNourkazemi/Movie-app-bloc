import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/search_filter/search_filter_event.dart';
import 'package:movie_app/bloc/search_filter/search_filter_state.dart';
import 'package:movie_app/data/datasource/search_filter_datasource/search_filter_datasource.dart';
import 'package:movie_app/data/repository/search_filter_repository/seach_filter_repository.dart';

import '../../di/di.dart';

class SearchFilterBloc extends Bloc<SearchFilterEvent, SearchFilterState> {
  final ISearchFilterRepository _filterRepository = locator.get();
  SearchFilterBloc() : super(SearchInitState()) {
    on<SearchFilterInitEvent>(
      (event, emit) {
        emit(SearchLoadingState());
      },
    );
    on<SearchFilterString>(
      (event, emit) async {
        var getString = await _filterRepository.getAnimeByFilter(q: event.q);
        emit(ResponseSearchFilterState(getString));
      },
    );
    on<SearchFilterOrderBy>(
      (event, emit) async {
        var getOrder =
            await _filterRepository.getAnimeByFilter(order: event.order);
        emit(ResponseSearchFilterState(getOrder));
      },
    );
    on<SearchFilterRating>(
      (event, emit) async {
        var getRatng =
            await _filterRepository.getAnimeByFilter(rating: event.rating);
        emit(ResponseSearchFilterState(getRatng));
      },
    );
  }
}
