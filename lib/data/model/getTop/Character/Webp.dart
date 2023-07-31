/// image_url : "string"
/// small_image_url : "string"

class Webp {
  Webp({
      String? imageUrl, 
      String? smallImageUrl,}){
    _imageUrl = imageUrl;
    _smallImageUrl = smallImageUrl;
}

  Webp.fromJson(dynamic json) {
    _imageUrl = json['image_url'];
    _smallImageUrl = json['small_image_url'];
  }
  String? _imageUrl;
  String? _smallImageUrl;
Webp copyWith({  String? imageUrl,
  String? smallImageUrl,
}) => Webp(  imageUrl: imageUrl ?? _imageUrl,
  smallImageUrl: smallImageUrl ?? _smallImageUrl,
);
  String? get imageUrl => _imageUrl;
  String? get smallImageUrl => _smallImageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image_url'] = _imageUrl;
    map['small_image_url'] = _smallImageUrl;
    return map;
  }

}