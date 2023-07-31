import 'Data.dart';

/// data : [{"character":{"mal_id":0,"url":"string","images":{"jpg":{"image_url":"string","small_image_url":"string"},"webp":{"image_url":"string","small_image_url":"string"}},"name":"string"},"role":"string","voice_actors":[{"person":{"mal_id":0,"url":"string","images":{"jpg":{"image_url":"string"}},"name":"string"},"language":"string"}]}]

class GetAnimeCharacterById {
  GetAnimeCharacterById({
      List<Data>? data,}){
    _data = data;
}

  GetAnimeCharacterById.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? _data;
GetAnimeCharacterById copyWith({  List<Data>? data,
}) => GetAnimeCharacterById(  data: data ?? _data,
);
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}