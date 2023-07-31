/// count : 0
/// total : 0
/// per_page : 0

class Items {
  Items({
      num? count, 
      num? total, 
      num? perPage,}){
    _count = count;
    _total = total;
    _perPage = perPage;
}

  Items.fromJson(dynamic json) {
    _count = json['count'];
    _total = json['total'];
    _perPage = json['per_page'];
  }
  num? _count;
  num? _total;
  num? _perPage;
Items copyWith({  num? count,
  num? total,
  num? perPage,
}) => Items(  count: count ?? _count,
  total: total ?? _total,
  perPage: perPage ?? _perPage,
);
  num? get count => _count;
  num? get total => _total;
  num? get perPage => _perPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    map['total'] = _total;
    map['per_page'] = _perPage;
    return map;
  }

}