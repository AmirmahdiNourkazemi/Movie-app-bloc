import 'Character.dart';
import 'VoiceActors.dart';

/// character : {"mal_id":0,"url":"string","images":{"jpg":{"image_url":"string","small_image_url":"string"},"webp":{"image_url":"string","small_image_url":"string"}},"name":"string"}
/// role : "string"
/// voice_actors : [{"person":{"mal_id":0,"url":"string","images":{"jpg":{"image_url":"string"}},"name":"string"},"language":"string"}]

class Data {
  Data({
      Character? character, 
      String? role, 
      List<VoiceActors>? voiceActors,}){
    _character = character;
    _role = role;
    _voiceActors = voiceActors;
}

  Data.fromJson(dynamic json) {
    _character = json['character'] != null ? Character.fromJson(json['character']) : null;
    _role = json['role'];
    if (json['voice_actors'] != null) {
      _voiceActors = [];
      json['voice_actors'].forEach((v) {
        _voiceActors?.add(VoiceActors.fromJson(v));
      });
    }
  }
  Character? _character;
  String? _role;
  List<VoiceActors>? _voiceActors;
Data copyWith({  Character? character,
  String? role,
  List<VoiceActors>? voiceActors,
}) => Data(  character: character ?? _character,
  role: role ?? _role,
  voiceActors: voiceActors ?? _voiceActors,
);
  Character? get character => _character;
  String? get role => _role;
  List<VoiceActors>? get voiceActors => _voiceActors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_character != null) {
      map['character'] = _character?.toJson();
    }
    map['role'] = _role;
    if (_voiceActors != null) {
      map['voice_actors'] = _voiceActors?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}