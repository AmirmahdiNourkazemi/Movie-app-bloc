class To {
  To({
    this.day,
    this.month,
    this.year,
  });

  To.fromJson(dynamic json) {
    day = json['day'];
    month = json['month'];
    year = json['year'];
  }

  int? day;
  int? month;
  int? year;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = day;
    map['month'] = month;
    map['year'] = year;
    return map;
  }
}
