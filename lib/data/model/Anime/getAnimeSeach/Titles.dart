class Titles {
  Titles({
    this.type,
    this.title,
  });

  Titles.fromJson(dynamic json) {
    type = json['type'];
    title = json['title'];
  }
  String? type;
  String? title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['title'] = title;
    return map;
  }
}
