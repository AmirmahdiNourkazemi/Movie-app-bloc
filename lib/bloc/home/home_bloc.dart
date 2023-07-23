import 'package:bloc/bloc.dart';
import 'package:movie_app/bloc/home/home_event.dart';
import 'package:movie_app/bloc/home/home_state.dart';
import 'package:movie_app/data/repository/getTopAnime_repository.dart';
import 'package:movie_app/di/di.dart';
import 'package:movie_app/screens/home_screen/home_screen.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IgetTopAnimeRepository _animeRepository = locator.get();
  HomeBloc() : super(HomeInitState()) {
    on<HomeInitEvent>(
      (event, emit) async {
        emit(HomeLoadingState());
        var getTopAnime = await _animeRepository.getTopAnime();
        emit(ResponseSuccessState(getTopAnime));
      },
    );
  }
}
