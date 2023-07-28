class Data {
  Data({
    this.malId,
    this.name,
    this.url,
    this.count,
  });

  Data.fromJson(dynamic json) {
    malId = json['mal_id'];
    name = json['name'];
    url = json['url'];
    count = json['count'];
  }
  int? malId;
  String? name;
  String? url;
  int? count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mal_id'] = malId;
    map['name'] = name;
    map['url'] = url;
    map['count'] = count;
    return map;
  }
}
