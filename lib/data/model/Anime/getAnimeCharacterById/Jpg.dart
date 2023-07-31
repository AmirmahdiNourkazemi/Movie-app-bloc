/// image_url : "string"

class Jpg {
  Jpg({
      String? imageUrl,}){
    _imageUrl = imageUrl;
}

  Jpg.fromJson(dynamic json) {
    _imageUrl = json['image_url'];
  }
  String? _imageUrl;
Jpg copyWith({  String? imageUrl,
}) => Jpg(  imageUrl: imageUrl ?? _imageUrl,
);
  String? get imageUrl => _imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image_url'] = _imageUrl;
    return map;
  }

}