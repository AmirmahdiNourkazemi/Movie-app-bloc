import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/data/repository/getTopAnime_repository.dart';

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
  //repository
  locator.registerFactory<IgetTopAnimeRepository>(() => GetTopAnimeRemote());
}
