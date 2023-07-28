import 'package:dartz/dartz.dart';
import 'package:movie_app/data/model/Magazine/Magazine.dart';

abstract class MagazineState {}

class MagazineInitState extends MagazineState {}

class MagazineLoadingState extends MagazineState {}

class MagazineSuccessResponseState extends MagazineState {
  Either<String, Magazine> getMagazine;
  MagazineSuccessResponseState(this.getMagazine);
}
