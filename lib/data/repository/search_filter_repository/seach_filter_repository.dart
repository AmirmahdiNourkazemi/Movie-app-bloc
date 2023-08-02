import 'package:dartz/dartz.dart';
import 'package:movie_app/data/datasource/search_filter_datasource/search_filter_datasource.dart';
import 'package:movie_app/data/model/Anime/getAnimeSeach/GetAnimeSearch.dart';
import 'package:movie_app/di/di.dart';

import '../../../utils/api_exeption.dart';

abstract class ISearchFilterRepository {
  Future<Either<String, GetAnimeSearch>> getAnimeByFilter(
      {String q = "", String order = "title", String rating = "g"});
}

class SearchFilterRemote extends ISearchFilterRepository {
  @override
  final ISearchFilterDatasource _filterDatasource = locator.get();
  Future<Either<String, GetAnimeSearch>> getAnimeByFilter(
      {String q = "", String order = "title", String rating = "g"}) async {
    try {
      var response = await _filterDatasource.getAnimeByFilter();
      return right(response);
    } on ApiExeption catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
