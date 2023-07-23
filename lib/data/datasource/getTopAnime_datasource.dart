import 'package:dio/dio.dart';
import 'package:movie_app/data/model/Anime.dart';

import '../../di/di.dart';
import '../../utils/api_exeption.dart';
import '../model/Data.dart';

abstract class IgetTopAnimeDatasource {
  Future<Anime> getTopAnime();
}

class GetTopAnimeDatasource extends IgetTopAnimeDatasource {
  final Dio _dio = locator.get();

  Future<Anime> getTopAnime() async {
    final response = await _dio.get('top/anime');
    try {
      return Anime.fromJson(response.data);
    } on DioError catch (ex) {
      throw ApiExeption(ex.response?.data['message'], ex.response?.statusCode);
    } catch (ex) {
      throw ApiExeption('unknown error happend', 0);
    }
    // if (response.statusCode == 200) {
    //   List<Data> _data = [];
    //   if (response.data['data'] != null) {
    //     response.data['data'].forEach((v) {
    //       _data?.add(Data.fromJson(v));
    //     });
    //   }
    //   //print(_data);

    // } else {
    //   throw Exception();
    // }
    //final List<dynamic> dataeList = response.data;
  }
}
