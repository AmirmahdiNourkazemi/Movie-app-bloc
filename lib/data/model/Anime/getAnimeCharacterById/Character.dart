import 'Images.dart';

/// mal_id : 0
/// url : "string"
/// images : {"jpg":{"image_url":"string","small_image_url":"string"},"webp":{"image_url":"string","small_image_url":"string"}}
/// name : "string"

class Character {
  Character({
      num? malId, 
      String? url, 
      Images? images, 
      String? name,}){
    _malId = malId;
    _url = url;
    _images = images;
    _name = name;
}

  Character.fromJson(dynamic json) {
    _malId = json['mal_id'];
    _url = json['url'];
    _images = json['images'] != null ? Images.fromJson(json['images']) : null;
    _name = json['name'];
  }
  num? _malId;
  String? _url;
  Images? _images;
  String? _name;
Character copyWith({  num? malId,
  String? url,
  Images? images,
  String? name,
}) => Character(  malId: malId ?? _malId,
  url: url ?? _url,
  images: images ?? _images,
  name: name ?? _name,
);
  num? get malId => _malId;
  String? get url => _url;
  Images? get images => _images;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mal_id'] = _malId;
    map['url'] = _url;
    if (_images != null) {
      map['images'] = _images?.toJson();
    }
    map['name'] = _name;
    return map;
  }

}