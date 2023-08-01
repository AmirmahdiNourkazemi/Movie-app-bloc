/// openings : ["string"]
/// endings : ["string"]

class Theme {
  Theme({
      List<String>? openings, 
      List<String>? endings,}){
    _openings = openings;
    _endings = endings;
}

  Theme.fromJson(dynamic json) {
    _openings = json['openings'] != null ? json['openings'].cast<String>() : [];
    _endings = json['endings'] != null ? json['endings'].cast<String>() : [];
  }
  List<String>? _openings;
  List<String>? _endings;
Theme copyWith({  List<String>? openings,
  List<String>? endings,
}) => Theme(  openings: openings ?? _openings,
  endings: endings ?? _endings,
);
  List<String>? get openings => _openings;
  List<String>? get endings => _endings;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['openings'] = _openings;
    map['endings'] = _endings;
    return map;
  }

}