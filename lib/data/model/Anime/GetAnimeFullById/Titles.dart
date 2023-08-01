/// type : "string"
/// title : "string"

class Titles {
  Titles({
      String? type, 
      String? title,}){
    _type = type;
    _title = title;
}

  Titles.fromJson(dynamic json) {
    _type = json['type'];
    _title = json['title'];
  }
  String? _type;
  String? _title;
Titles copyWith({  String? type,
  String? title,
}) => Titles(  type: type ?? _type,
  title: title ?? _title,
);
  String? get type => _type;
  String? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['title'] = _title;
    return map;
  }

}