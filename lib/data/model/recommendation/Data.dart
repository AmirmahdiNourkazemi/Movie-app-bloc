import 'Entry.dart';

class Data {
  Data({
      this.malId, 
      this.entry,});

  Data.fromJson(dynamic json) {
    malId = json['mal_id'];
    if (json['entry'] != null) {
      entry = [];
      json['entry'].forEach((v) {
        entry.add(Entry.fromJson(v));
      });
    }
  }
  String malId;
  List<Entry> entry;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mal_id'] = malId;
    if (entry != null) {
      map['entry'] = entry.map((v) => v.toJson()).toList();
    }
    return map;
  }

}