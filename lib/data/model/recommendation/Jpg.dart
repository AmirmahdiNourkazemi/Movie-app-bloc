class Jpg {
  Jpg({
      this.imageUrl, 
      this.smallImageUrl, 
      this.largeImageUrl,});

  Jpg.fromJson(dynamic json) {
    imageUrl = json['image_url'];
    smallImageUrl = json['small_image_url'];
    largeImageUrl = json['large_image_url'];
  }
  String imageUrl;
  String smallImageUrl;
  String largeImageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image_url'] = imageUrl;
    map['small_image_url'] = smallImageUrl;
    map['large_image_url'] = largeImageUrl;
    return map;
  }

}