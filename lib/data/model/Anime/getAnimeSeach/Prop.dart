import 'From.dart';
import 'To.dart';

class Prop {
  Prop({
    this.from,
    this.to,
    this.string,
  });

  Prop.fromJson(dynamic json) {
    from = json['from'] != null ? From.fromJson(json['from']) : null;
    to = json['to'] != null ? To.fromJson(json['to']) : null;
    string = json['string'];
  }
  From? from;
  To? to;
  String? string;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (from != null) {
      map['from'] = from!.toJson();
    }
    if (to != null) {
      map['to'] = to!.toJson();
    }
    map['string'] = string;
    return map;
  }
}
