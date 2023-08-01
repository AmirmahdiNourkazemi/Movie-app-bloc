import 'Entry.dart';

class Data {
  Data({
    this.entry,
  });

  Data.fromJson(dynamic json) {
    entry = json['entry'] != null ? Entry.fromJson(json['entry']) : null;
  }
  Entry? entry;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (entry != null) {
      map['entry'] = entry!.toJson();
    }
    return map;
  }
}
