/// day : 0
/// month : 0
/// year : 0

class To {
  To({
      num? day, 
      num? month, 
      num? year,}){
    _day = day;
    _month = month;
    _year = year;
}

  To.fromJson(dynamic json) {
    _day = json['day'];
    _month = json['month'];
    _year = json['year'];
  }
  num? _day;
  num? _month;
  num? _year;
To copyWith({  num? day,
  num? month,
  num? year,
}) => To(  day: day ?? _day,
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