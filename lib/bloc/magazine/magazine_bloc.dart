import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/magazine/magazine_event.dart';
import 'package:movie_app/bloc/magazine/magazine_state.dart';
import 'package:movie_app/data/repository/getMagazine_repository.dart';

import '../../di/di.dart';

class MagazineBloc extends Bloc<MagazineEvent, MagazineState> {
  final IgetMagazineRepository _magazineRepository = locator.get();
  MagazineBloc() : super(MagazineInitState()) {
    on<MagazineInitEvent>(
      (event, emit) async {
        emit(MagazineLoadingState());
        var getMagazine = await _magazineRepository.getMagazine();
        emit(MagazineSuccessResponseState(getMagazine));
      },
    );
  }
}
