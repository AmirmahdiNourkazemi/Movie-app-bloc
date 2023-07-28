import 'Data.dart';
import 'Pagination.dart';

/// data : [{"mal_id":0,"url":"string","images":{"jpg":{"image_url":"string","small_image_url":"string"},"webp":{"image_url":"string","small_image_url":"string"}},"name":"string","name_kanji":"string","nicknames":["string"],"favorites":0,"about":"string"}]
/// pagination : {"last_visible_page":0,"has_next_page":true,"items":{"count":0,"total":0,"per_page":0}}

class Character {
  Character({
      List<Data>? data, 
      Pagination? pagination,}){
    _data = data;
    _pagination = pagination;
}

  Character.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
  }
  List<Data>? _data;
  Pagination? _pagination;
Character copyWith({  List<Data>? data,
  Pagination? pagination,
}) => Character(  data: data ?? _data,
  pagination: pagination ?? _pagination,
);
  List<Data>? get data => _data;
  Pagination? get pagination => _pagination;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    if (_pagination != null) {
      map['pagination'] = _pagination?.toJson();
    }
    return map;
  }

}