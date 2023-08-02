class Broadcast {
  Broadcast({
    this.day,
    this.time,
    this.timezone,
    this.string,
  });

  Broadcast.fromJson(dynamic json) {
    day = json['day'];
    time = json['time'];
    timezone = json['timezone'];
    string = json['string'];
  }
  String? day;
  String? time;
  String? timezone;
  String? string;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = day;
    map['time'] = time;
    map['timezone'] = timezone;
    map['string'] = string;
    return map;
  }
}
