class Images {
  final Jpg jpg;
  final Jpg webp;

  Images({required this.jpg, required this.webp});

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
        jpg: Jpg.fromJson(json['jpg']), webp: Jpg.fromJson(json['webp']));
  }

  Map<String, dynamic> toJson() {
    return {'jpg': jpg.toJson(), 'webp': webp.toJson()};
  }
}

class Jpg {
  final String imageUrl;
  final String smallImageUrl;
  final String largeImageUrl;

  Jpg(
      {required this.imageUrl,
      required this.smallImageUrl,
      required this.largeImageUrl});

  factory Jpg.fromJson(Map<String, dynamic> json) {
    return Jpg(
        imageUrl: json['image_url'],
        smallImageUrl: json['small_image_url'],
        largeImageUrl: json['large_image_url']);
  }

  Map<String, dynamic> toJson() {
    return {
      'image_url': imageUrl,
      'small_image_url': smallImageUrl,
      'large_image_url': largeImageUrl
    };
  }
}
