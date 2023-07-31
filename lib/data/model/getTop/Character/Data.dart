import 'Images.dart';

/// mal_id : 0
/// url : "string"
/// images : {"jpg":{"image_url":"string","small_image_url":"string"},"webp":{"image_url":"string","small_image_url":"string"}}
/// name : "string"
/// name_kanji : "string"
/// nicknames : ["string"]
/// favorites : 0
/// about : "string"

class Data {
  Data({
      num? malId, 
      String? url, 
      Images? images, 
      String? name, 
      String? nameKanji, 
      List<String>? nicknames, 
      num? favorites, 
      String? about,}){
    _malId = malId;
    _url = url;
    _images = images;
    _name = name;
    _nameKanji = nameKanji;
    _nicknames = nicknames;
    _favorites = favorites;
    _about = about;
}

  Data.fromJson(dynamic json) {
    _malId = json['mal_id'];
    _url = json['url'];
    _images = json['images'] != null ? Images.fromJson(json['images']) : null;
    _name = json['name'];
    _nameKanji = json['name_kanji'];
    _nicknames = json['nicknames'] != null ? json['nicknames'].cast<String>() : [];
    _favorites = json['favorites'];
    _about = json['about'];
  }
  num? _malId;
  String? _url;
  Images? _images;
  String? _name;
  String? _nameKanji;
  List<String>? _nicknames;
  num? _favorites;
  String? _about;
Data copyWith({  num? malId,
  String? url,
  Images? images,
  String? name,
  String? nameKanji,
  List<String>? nicknames,
  num? favorites,
  String? about,
}) => Data(  malId: malId ?? _malId,
  url: url ?? _url,
  images: images ?? _images,
  name: name ?? _name,
  nameKanji: nameKanji ?? _nameKanji,
  nicknames: nicknames ?? _nicknames,
  favorites: favorites ?? _favorites,
  about: about ?? _about,
);
  num? get malId => _malId;
  String? get url => _url;
  Images? get images => _images;
  String? get name => _name;
  String? get nameKanji => _nameKanji;
  List<String>? get nicknames => _nicknames;
  num? get favorites => _favorites;
  String? get about => _about;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mal_id'] = _malId;
    map['url'] = _url;
    if (_images != null) {
      map['images'] = _images?.toJson();
    }
    map['name'] = _name;
    map['name_kanji'] = _nameKanji;
    map['nicknames'] = _nicknames;
    map['favorites'] = _favorites;
    map['about'] = _about;
    return map;
  }

}