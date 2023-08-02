import 'Prop.dart';

class Aired {
  Aired({
    this.from,
    this.to,
    this.prop,
  });

  Aired.fromJson(dynamic json) {
    from = json['from'];
    to = json['to'];
    prop = json['prop'] != null ? Prop.fromJson(json['prop']) : null;
  }
  String? from;
  String? to;
  Prop? prop;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['from'] = from;
    map['to'] = to;
    if (prop != null) {
      map['prop'] = prop!.toJson();
    }
    return map;
  }
}
