import 'image.dart';

class Trailer {
  final String youtubeId;
  final String url;
  final String embedUrl;
  final Images images;

  Trailer(
      {required this.youtubeId,
      required this.url,
      required this.embedUrl,
      required this.images});

  factory Trailer.fromJson(Map<String, dynamic> json) {
    return Trailer(
        youtubeId: json['youtube_id'],
        url: json['url'],
        embedUrl: json['embed_url'],
        images: Images.fromJson(json['images']));
  }

  Map<String, dynamic> toJson() {
    return {
      'youtube_id': youtubeId,
      'url': url,
      'embed_url': embedUrl,
      'images': images.toJson()
    };
  }
}
