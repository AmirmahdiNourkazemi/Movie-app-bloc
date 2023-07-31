import 'Jpg.dart';

/// jpg : {"image_url":"string"}

class Images {
  Images({
      Jpg? jpg,}){
    _jpg = jpg;
}

  Images.fromJson(dynamic json) {
    _jpg = json['jpg'] != null ? Jpg.fromJson(json['jpg']) : null;
  }
  Jpg? _jpg;
Images copyWith({  Jpg? jpg,
}) => Images(  jpg: jpg ?? _jpg,
);
  Jpg? get jpg => _jpg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_jpg != null) {
      map['jpg'] = _jpg?.toJson();
    }
    return map;
  }

}