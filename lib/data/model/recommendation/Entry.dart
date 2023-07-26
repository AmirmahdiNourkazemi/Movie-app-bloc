import 'Images.dart';

class Entry {
  Entry({
      this.malId, 
      this.url, 
      this.images, 
      this.title,});

  Entry.fromJson(dynamic json) {
    malId = json['mal_id'];
    url = json['url'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    title = json['title'];
  }
  int malId;
  String url;
  Images images;
  String title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mal_id'] = malId;
    map['url'] = url;
    if (images != null) {
      map['images'] = images.toJson();
    }
    map['title'] = title;
    return map;
  }

}