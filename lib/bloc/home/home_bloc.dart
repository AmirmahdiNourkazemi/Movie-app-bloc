import 'package:bloc/bloc.dart';
import 'package:movie_app/bloc/home/home_event.dart';
import 'package:movie_app/bloc/home/home_state.dart';
import 'package:movie_app/data/repository/getSeason_repository.dart';
import 'package:movie_app/data/repository/getTopAnime_repository.dart';
import 'package:movie_app/data/repository/getTopCharacter_repository.dart';
import 'package:movie_app/di/di.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IgetTopAnimeRepository _animeRepository = locator.get();
  final IgetSeasonRepository _igetSeasonRepository = locator.get();
  final IgetCharacterRepository _characterRepository = locator.get();
  HomeBloc() : super(HomeInitState()) {
    on<HomeInitEvent>(
      (event, emit) async {
        emit(HomeLoadingState());
        var getTopAnimeBanner = await _animeRepository.getTopAnimeBanner();
        var getTopAnime = await _animeRepository.getTopAnime();
        var getSeasons = await _igetSeasonRepository.getSeasonNow();
        var getTopCharacters = await _characterRepository.getTopCharacter();
        emit(
          ResponseSuccessState(
              getTopAnimeBanner, getTopAnime, getSeasons, getTopCharacters),
        );
      },
    );
  }
}
