import 'Person.dart';

/// person : {"mal_id":0,"url":"string","images":{"jpg":{"image_url":"string"}},"name":"string"}
/// language : "string"

class VoiceActors {
  VoiceActors({
      Person? person, 
      String? language,}){
    _person = person;
    _language = language;
}

  VoiceActors.fromJson(dynamic json) {
    _person = json['person'] != null ? Person.fromJson(json['person']) : null;
    _language = json['language'];
  }
  Person? _person;
  String? _language;
VoiceActors copyWith({  Person? person,
  String? language,
}) => VoiceActors(  person: person ?? _person,
  language: language ?? _language,
);
  Person? get person => _person;
  String? get language => _language;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_person != null) {
      map['person'] = _person?.toJson();
    }
    map['language'] = _language;
    return map;
  }

}