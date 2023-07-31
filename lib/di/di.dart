import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/data/datasource/getAnimeDetailById_datasource.dart';
import 'package:movie_app/data/datasource/getMagazine_datasource.dart';
import 'package:movie_app/data/repository/getAnimeDetailById_repository.dart';
import 'package:movie_app/data/repository/getMagazine_repository.dart';
import 'package:movie_app/data/repository/getRecommendation_repository.dart';
import 'package:movie_app/data/repository/getSeason_repository.dart';
import 'package:movie_app/data/repository/getTopAnime_repository.dart';
import 'package:movie_app/data/repository/getTopCharacter_repository.dart';

import '../data/datasource/TopDatasources/getRecommendation_datasource.dart';
import '../data/datasource/TopDatasources/getSeason_datasource.dart';
import '../data/datasource/TopDatasources/getTopAnime_datasource.dart';
import '../data/datasource/TopDatasources/getTopCharacter_datasource.dart';

var locator = GetIt.instance;

Future<void> getItInit() async {
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(baseUrl: 'https://api.jikan.moe/v4/'),
    ),
  );

  //datasource
  locator
      .registerFactory<IgetTopAnimeDatasource>(() => GetTopAnimeDatasource());
  locator
      .registerFactory<IgetSeasonsDatasource>(() => GetSeasonNowDatasource());
  locator.registerFactory<IgetRecomDatasource>(() => GetRecomDatasource());
  locator
      .registerFactory<IgetCharacterDatasource>(() => GetCharacterDatasource());
  locator
      .registerFactory<IgetMagazineDatasource>(() => GetMagazineDatasource());
  locator.registerFactory<IgetAnimeDetailsDatasource>(
      () => GetAnimeDetailsDatasource());
  //repository
  locator.registerFactory<IgetTopAnimeRepository>(() => GetTopAnimeRemote());
  locator.registerFactory<IgetSeasonRepository>(() => GetSeasonRemote());
  locator.registerFactory<IgetRecomRepository>(() => GetRecomRemote());
  locator.registerFactory<IgetCharacterRepository>(() => GetCharacterRemote());
  locator.registerFactory<IgetMagazineRepository>(() => GetMagazineRemote());
  locator.registerFactory<IgetAnimeDetailByIdRepository>(
      () => GetAnimeDetailByIdRemote());
}
