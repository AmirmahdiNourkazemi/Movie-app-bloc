import 'package:dartz/dartz.dart';
import 'package:movie_app/data/datasource/TopDatasources/search_datasource.dart';
import 'package:movie_app/data/model/Anime/getAnimeSeach/GetAnimeSearch.dart';
import 'package:movie_app/di/di.dart';

import '../../utils/api_exeption.dart';

abstract class IsearchRepository {
  Future<Either<String, GetAnimeSearch>> searchAnime(String word);
}

class SearchRemote extends IsearchRepository {
  final IsearchDatasource _datasource = locator.get();
  Future<Either<String, GetAnimeSearch>> searchAnime(String word) async {
    try {
      var response = await _datasource.getAnimeSearch(word);
      return right(response);
    } on ApiExeption catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
