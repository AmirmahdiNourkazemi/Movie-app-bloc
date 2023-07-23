class Trailer {
  Trailer({
    this.youtubeId,
    this.url,
    this.embedUrl,
  });

  Trailer.fromJson(dynamic json) {
    youtubeId = json['youtube_id'];
    url = json['url'];
    embedUrl = json['embed_url'];
  }

  String? youtubeId;
  String? url;
  String? embedUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['youtube_id'] = youtubeId;
    map['url'] = url;
    map['embed_url'] = embedUrl;
    return map;
  }
}
