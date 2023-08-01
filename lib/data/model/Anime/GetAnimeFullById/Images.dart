import 'Jpg.dart';
import 'Webp.dart';

/// jpg : {"image_url":"string","small_image_url":"string","large_image_url":"string"}
/// webp : {"image_url":"string","small_image_url":"string","large_image_url":"string"}

class Images {
  Images({
      Jpg? jpg, 
      Webp? webp,}){
    _jpg = jpg;
    _webp = webp;
}

  Images.fromJson(dynamic json) {
    _jpg = json['jpg'] != null ? Jpg.fromJson(json['jpg']) : null;
    _webp = json['webp'] != null ? Webp.fromJson(json['webp']) : null;
  }
  Jpg? _jpg;
  Webp? _webp;
Images copyWith({  Jpg? jpg,
  Webp? webp,
}) => Images(  jpg: jpg ?? _jpg,
  webp: webp ?? _webp,
);
  Jpg? get jpg => _jpg;
  Webp? get webp => _webp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_jpg != null) {
      map['jpg'] = _jpg?.toJson();
    }
    if (_webp != null) {
      map['webp'] = _webp?.toJson();
    }
    return map;
  }

}