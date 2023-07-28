/// image_url : "string"
/// small_image_url : "string"

class Jpg {
  Jpg({
      String? imageUrl, 
      String? smallImageUrl,}){
    _imageUrl = imageUrl;
    _smallImageUrl = smallImageUrl;
}

  Jpg.fromJson(dynamic json) {
    _imageUrl = json['image_url'];
    _smallImageUrl = json['small_image_url'];
  }
  String? _imageUrl;
  String? _smallImageUrl;
Jpg copyWith({  String? imageUrl,
  String? smallImageUrl,
}) => Jpg(  imageUrl: imageUrl ?? _imageUrl,
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