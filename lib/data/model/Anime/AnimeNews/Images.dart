import 'Jpg.dart';

class Images {
  Images({
    this.jpg,
  });

  Images.fromJson(dynamic json) {
    jpg = json['jpg'] != null ? Jpg.fromJson(json['jpg']) : null;
  }
  Jpg? jpg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (jpg != null) {
      map['jpg'] = jpg!.toJson();
    }
    return map;
  }
}
