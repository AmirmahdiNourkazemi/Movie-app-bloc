/// youtube_id : "string"
/// url : "string"
/// embed_url : "string"

class Trailer {
  Trailer({
      String? youtubeId, 
      String? url, 
      String? embedUrl,}){
    _youtubeId = youtubeId;
    _url = url;
    _embedUrl = embedUrl;
}

  Trailer.fromJson(dynamic json) {
    _youtubeId = json['youtube_id'];
    _url = json['url'];
    _embedUrl = json['embed_url'];
  }
  String? _youtubeId;
  String? _url;
  String? _embedUrl;
Trailer copyWith({  String? youtubeId,
  String? url,
  String? embedUrl,
}) => Trailer(  youtubeId: youtubeId ?? _youtubeId,
  url: url ?? _url,
  embedUrl: embedUrl ?? _embedUrl,
);
  String? get youtubeId => _youtubeId;
  String? get url => _url;
  String? get embedUrl => _embedUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['youtube_id'] = _youtubeId;
    map['url'] = _url;
    map['embed_url'] = _embedUrl;
    return map;
  }

}