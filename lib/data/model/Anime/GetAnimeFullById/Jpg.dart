/// image_url : "string"
/// small_image_url : "string"
/// large_image_url : "string"

class Jpg {
  Jpg({
      String? imageUrl, 
      String? smallImageUrl, 
      String? largeImageUrl,}){
    _imageUrl = imageUrl;
    _smallImageUrl = smallImageUrl;
    _largeImageUrl = largeImageUrl;
}

  Jpg.fromJson(dynamic json) {
    _imageUrl = json['image_url'];
    _smallImageUrl = json['small_image_url'];
    _largeImageUrl = json['large_image_url'];
  }
  String? _imageUrl;
  String? _smallImageUrl;
  String? _largeImageUrl;
Jpg copyWith({  String? imageUrl,
  String? smallImageUrl,
  String? largeImageUrl,
}) => Jpg(  imageUrl: imageUrl ?? _imageUrl,
  smallImageUrl: smallImageUrl ?? _smallImageUrl,
  largeImageUrl: largeImageUrl ?? _largeImageUrl,
);
  String? get imageUrl => _imageUrl;
  String? get smallImageUrl => _smallImageUrl;
  String? get largeImageUrl => _largeImageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image_url'] = _imageUrl;
    map['small_image_url'] = _smallImageUrl;
    map['large_image_url'] = _largeImageUrl;
    return map;
  }

}