class Pagination {
  Pagination({
    this.lastVisiblePage,
    this.hasNextPage,
  });

  Pagination.fromJson(dynamic json) {
    lastVisiblePage = json['last_visible_page'];
    hasNextPage = json['has_next_page'];
  }
  int? lastVisiblePage;
  bool? hasNextPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['last_visible_page'] = lastVisiblePage;
    map['has_next_page'] = hasNextPage;
    return map;
  }
}
