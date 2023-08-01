/// day : 0
/// month : 0
/// year : 0

class From {
  From({
      num? day, 
      num? month, 
      num? year,}){
    _day = day;
    _month = month;
    _year = year;
}

  From.fromJson(dynamic json) {
    _day = json['day'];
    _month = json['month'];
    _year = json['year'];
  }
  num? _day;
  num? _month;
  num? _year;
From copyWith({  num? day,
  num? month,
  num? year,
}) => From(  day: day ?? _day,
  month: month ?? _month,
  year: year ?? _year,
);
  num? get day => _day;
  num? get month => _month;
  num? get year => _year;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = _day;
    map['month'] = _month;
    map['year'] = _year;
    return map;
  }

}