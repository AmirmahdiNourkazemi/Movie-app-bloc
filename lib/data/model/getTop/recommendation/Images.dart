import 'Jpg.dart';
import 'Webp.dart';

class Images {
  Images({
    this.jpg,
    this.webp,
  });

  Images.fromJson(dynamic json) {
    jpg = json['jpg'] != null ? Jpg.fromJson(json['jpg']) : null;
    webp = json['webp'] != null ? Webp.fromJson(json['webp']) : null;
  }
  Jpg? jpg;
  Webp? webp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (jpg != null) {
      map['jpg'] = jpg!.toJson();
    }
    if (webp != null) {
      map['webp'] = webp!.toJson();
    }
    return map;
  }
}
