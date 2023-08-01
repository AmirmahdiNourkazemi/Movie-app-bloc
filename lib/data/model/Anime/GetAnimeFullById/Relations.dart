import 'Entry.dart';

/// relation : "string"
/// entry : [{"mal_id":0,"type":"string","name":"string","url":"string"}]

class Relations {
  Relations({
      String? relation, 
      List<Entry>? entry,}){
    _relation = relation;
    _entry = entry;
}

  Relations.fromJson(dynamic json) {
    _relation = json['relation'];
    if (json['entry'] != null) {
      _entry = [];
      json['entry'].forEach((v) {
        _entry?.add(Entry.fromJson(v));
      });
    }
  }
  String? _relation;
  List<Entry>? _entry;
Relations copyWith({  String? relation,
  List<Entry>? entry,
}) => Relations(  relation: relation ?? _relation,
  entry: entry ?? _entry,
);
  String? get relation => _relation;
  List<Entry>? get entry => _entry;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['relation'] = _relation;
    if (_entry != null) {
      map['entry'] = _entry?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}