import 'From.dart';
import 'To.dart';

/// from : {"day":0,"month":0,"year":0}
/// to : {"day":0,"month":0,"year":0}
/// string : "string"

class Prop {
  Prop({
      From? from, 
      To? to, 
      String? string,}){
    _from = from;
    _to = to;
    _string = string;
}

  Prop.fromJson(dynamic json) {
    _from = json['from'] != null ? From.fromJson(json['from']) : null;
    _to = json['to'] != null ? To.fromJson(json['to']) : null;
    _string = json['string'];
  }
  From? _from;
  To? _to;
  String? _string;
Prop copyWith({  From? from,
  To? to,
  String? string,
}) => Prop(  from: from ?? _from,
  to: to ?? _to,
  string: string ?? _string,
);
  From? get from => _from;
  To? get to => _to;
  String? get string => _string;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_from != null) {
      map['from'] = _from?.toJson();
    }
    if (_to != null) {
      map['to'] = _to?.toJson();
    }
    map['string'] = _string;
    return map;
  }

}