import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie_detail/movie_detail_event.dart';
import 'package:movie_app/bloc/movie_detail/movie_detail_state.dart';
import 'package:movie_app/data/repository/getAnimeDetailById_repository.dart';
import 'package:movie_app/data/repository/getTopCharacter_repository.dart';
import 'package:movie_app/di/di.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final IgetAnimeDetailByIdRepository _animeDetailByIdRepository =
      locator.get();
  MovieDetailBloc() : super(MovieDetialLoadingState()) {
    on<MovieDetailInitEvent>(
      (event, emit) async {
        var movieDetailById = await _animeDetailByIdRepository
            .getAnimeCharacterById(event.mal_id);
        emit(MovieDetailResponseSuccessState(movieDetailById));
      },
    );
  }
}
