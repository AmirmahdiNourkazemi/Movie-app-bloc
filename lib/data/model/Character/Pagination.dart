import 'Items.dart';

/// last_visible_page : 0
/// has_next_page : true
/// items : {"count":0,"total":0,"per_page":0}

class Pagination {
  Pagination({
      num? lastVisiblePage, 
      bool? hasNextPage, 
      Items? items,}){
    _lastVisiblePage = lastVisiblePage;
    _hasNextPage = hasNextPage;
    _items = items;
}

  Pagination.fromJson(dynamic json) {
    _lastVisiblePage = json['last_visible_page'];
    _hasNextPage = json['has_next_page'];
    _items = json['items'] != null ? Items.fromJson(json['items']) : null;
  }
  num? _lastVisiblePage;
  bool? _hasNextPage;
  Items? _items;
Pagination copyWith({  num? lastVisiblePage,
  bool? hasNextPage,
  Items? items,
}) => Pagination(  lastVisiblePage: lastVisiblePage ?? _lastVisiblePage,
  hasNextPage: hasNextPage ?? _hasNextPage,
  items: items ?? _items,
);
  num? get lastVisiblePage => _lastVisiblePage;
  bool? get hasNextPage => _hasNextPage;
  Items? get items => _items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['last_visible_page'] = _lastVisiblePage;
    map['has_next_page'] = _hasNextPage;
    if (_items != null) {
      map['items'] = _items?.toJson();
    }
    return map;
  }

}