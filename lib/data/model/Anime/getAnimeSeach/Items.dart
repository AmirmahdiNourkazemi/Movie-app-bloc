class Items {
  Items({
    this.count,
    this.total,
    this.perPage,
  });

  Items.fromJson(dynamic json) {
    count = json['count'];
    total = json['total'];
    perPage = json['per_page'];
  }
  int? count;
  int? total;
  int? perPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['total'] = total;
    map['per_page'] = perPage;
    return map;
  }
}
