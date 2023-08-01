import 'Prop.dart';

/// from : "string"
/// to : "string"
/// prop : {"from":{"day":0,"month":0,"year":0},"to":{"day":0,"month":0,"year":0},"string":"string"}

class Aired {
  Aired({
      String? from, 
      String? to, 
      Prop? prop,}){
    _from = from;
    _to = to;
    _prop = prop;
}

  Aired.fromJson(dynamic json) {
    _from = json['from'];
    _to = json['to'];
    _prop = json['prop'] != null ? Prop.fromJson(json['prop']) : null;
  }
  String? _from;
  String? _to;
  Prop? _prop;
Aired copyWith({  String? from,
  String? to,
  Prop? prop,
}) => Aired(  from: from ?? _from,
  to: to ?? _to,
  prop: prop ?? _prop,
);
  String? get from => _from;
  String? get to => _to;
  Prop? get prop => _prop;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['from'] = _from;
    map['to'] = _to;
    if (_prop != null) {
      map['prop'] = _prop?.toJson();
    }
    return map;
  }

}