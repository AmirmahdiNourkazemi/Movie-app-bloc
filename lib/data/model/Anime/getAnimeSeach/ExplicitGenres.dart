class ExplicitGenres {
  ExplicitGenres({
    this.malId,
    this.type,
    this.name,
    this.url,
  });

  ExplicitGenres.fromJson(dynamic json) {
    malId = json['mal_id'];
    type = json['type'];
    name = json['name'];
    url = json['url'];
  }
  int? malId;
  String? type;
  String? name;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mal_id'] = malId;
    map['type'] = type;
    map['name'] = name;
    map['url'] = url;
    return map;
  }
}
