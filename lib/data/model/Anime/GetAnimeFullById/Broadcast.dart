/// day : "string"
/// time : "string"
/// timezone : "string"
/// string : "string"

class Broadcast {
  Broadcast({
      String? day, 
      String? time, 
      String? timezone, 
      String? string,}){
    _day = day;
    _time = time;
    _timezone = timezone;
    _string = string;
}

  Broadcast.fromJson(dynamic json) {
    _day = json['day'];
    _time = json['time'];
    _timezone = json['timezone'];
    _string = json['string'];
  }
  String? _day;
  String? _time;
  String? _timezone;
  String? _string;
Broadcast copyWith({  String? day,
  String? time,
  String? timezone,
  String? string,
}) => Broadcast(  day: day ?? _day,
  time: time ?? _time,
  timezone: timezone ?? _timezone,
  string: string ?? _string,
);
  String? get day => _day;
  String? get time => _time;
  String? get timezone => _timezone;
  String? get string => _string;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = _day;
    map['time'] = _time;
    map['timezone'] = _timezone;
    map['string'] = _string;
    return map;
  }

}