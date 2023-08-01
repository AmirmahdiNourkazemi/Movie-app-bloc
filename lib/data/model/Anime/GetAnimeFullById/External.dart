/// name : "string"
/// url : "string"

class External {
  External({
      String? name, 
      String? url,}){
    _name = name;
    _url = url;
}

  External.fromJson(dynamic json) {
    _name = json['name'];
    _url = json['url'];
  }
  String? _name;
  String? _url;
External copyWith({  String? name,
  String? url,
}) => External(  name: name ?? _name,
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