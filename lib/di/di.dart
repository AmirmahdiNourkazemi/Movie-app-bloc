import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/data/datasource/getRecommendation_datasource.dart';
import 'package:movie_app/data/datasource/getSeason_datasource.dart';
import 'package:movie_app/data/datasource/getTopCharacter_datasource.dart';
import 'package:movie_app/data/repository/getRecommendation_repository.dart';
import 'package:movie_app/data/repository/getSeason_repository.dart';
import 'package:movie_app/data/repository/getTopAnime_repository.dart';
import 'package:movie_app/data/repository/getTopCharacter_repository.dart';

import '../data/datasource/getTopAnime_datasource.dart';

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
  //repository
  locator.registerFactory<IgetTopAnimeRepository>(() => GetTopAnimeRemote());
  locator.registerFactory<IgetSeasonRepository>(() => GetSeasonRemote());
  locator.registerFactory<IgetRecomRepository>(() => GetRecomRemote());
  locator.registerFactory<IgetCharacterRepository>(() => GetCharacterRemote());
}
