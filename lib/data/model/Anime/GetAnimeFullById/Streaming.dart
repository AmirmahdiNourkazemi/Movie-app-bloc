/// name : "string"
/// url : "string"

class Streaming {
  Streaming({
      String? name, 
      String? url,}){
    _name = name;
    _url = url;
}

  Streaming.fromJson(dynamic json) {
    _name = json['name'];
    _url = json['url'];
  }
  String? _name;
  String? _url;
Streaming copyWith({  String? name,
  String? url,
}) => Streaming(  name: name ?? _name,
  url: url ?? _url,
);
  String? get name => _name;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['url'] = _url;
    return map;
  }

}