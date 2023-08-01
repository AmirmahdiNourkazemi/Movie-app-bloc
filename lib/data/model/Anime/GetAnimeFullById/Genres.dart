/// mal_id : 0
/// type : "string"
/// name : "string"
/// url : "string"

class Genres {
  Genres({
      num? malId, 
      String? type, 
      String? name, 
      String? url,}){
    _malId = malId;
    _type = type;
    _name = name;
    _url = url;
}

  Genres.fromJson(dynamic json) {
    _malId = json['mal_id'];
    _type = json['type'];
    _name = json['name'];
    _url = json['url'];
  }
  num? _malId;
  String? _type;
  String? _name;
  String? _url;
Genres copyWith({  num? malId,
  String? type,
  String? name,
  String? url,
}) => Genres(  malId: malId ?? _malId,
  type: type ?? _type,
  name: name ?? _name,
  url: url ?? _url,
);
  num? get malId => _malId;
  String? get type => _type;
  String? get name => _name;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mal_id'] = _malId;
    map['type'] = _type;
    map['name'] = _name;
    map['url'] = _url;
    return map;
  }

}