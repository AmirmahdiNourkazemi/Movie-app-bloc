import 'Items.dart';

class Pagination {
  Pagination({
    this.lastVisiblePage,
    this.hasNextPage,
    this.items,
  });

  Pagination.fromJson(dynamic json) {
    lastVisiblePage = json['last_visible_page'];
    hasNextPage = json['has_next_page'];
    items = json['items'] != null ? Items.fromJson(json['items']) : null;
  }

  int? lastVisiblePage;
  bool? hasNextPage;
  Items? items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['last_visible_page'] = lastVisiblePage;
    map['has_next_page'] = hasNextPage;
    if (items != null) {
      map['items'] = items!.toJson();
    }
    return map;
  }
}
