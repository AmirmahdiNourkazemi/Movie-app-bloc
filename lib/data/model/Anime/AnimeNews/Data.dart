import 'Images.dart';

class Data {
  Data({
    this.malId,
    this.url,
    this.title,
    this.date,
    this.authorUsername,
    this.authorUrl,
    this.forumUrl,
    this.images,
    this.comments,
    this.excerpt,
  });

  Data.fromJson(dynamic json) {
    malId = json['mal_id'];
    url = json['url'];
    title = json['title'];
    date = json['date'];
    authorUsername = json['author_username'];
    authorUrl = json['author_url'];
    forumUrl = json['forum_url'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    comments = json['comments'];
    excerpt = json['excerpt'];
  }
  int? malId;
  String? url;
  String? title;
  String? date;
  String? authorUsername;
  String? authorUrl;
  String? forumUrl;
  Images? images;
  int? comments;
  String? excerpt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mal_id'] = malId;
    map['url'] = url;
    map['title'] = title;
    map['date'] = date;
    map['author_username'] = authorUsername;
    map['author_url'] = authorUrl;
    map['forum_url'] = forumUrl;
    if (images != null) {
      map['images'] = images!.toJson();
    }
    map['comments'] = comments;
    map['excerpt'] = excerpt;
    return map;
  }
}
