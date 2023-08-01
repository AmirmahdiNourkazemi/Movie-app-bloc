import 'Images.dart';
import 'Trailer.dart';
import 'Titles.dart';
import 'Aired.dart';
import 'Broadcast.dart';
import 'Producers.dart';
import 'Licensors.dart';
import 'Studios.dart';
import 'Genres.dart';
import 'ExplicitGenres.dart';
import 'Themes.dart';
import 'Demographics.dart';
import 'Relations.dart';
import 'Theme.dart';
import 'External.dart';
import 'Streaming.dart';

/// mal_id : 0
/// url : "string"
/// images : {"jpg":{"image_url":"string","small_image_url":"string","large_image_url":"string"},"webp":{"image_url":"string","small_image_url":"string","large_image_url":"string"}}
/// trailer : {"youtube_id":"string","url":"string","embed_url":"string"}
/// approved : true
/// titles : [{"type":"string","title":"string"}]
/// title : "string"
/// title_english : "string"
/// title_japanese : "string"
/// title_synonyms : ["string"]
/// type : "TV"
/// source : "string"
/// episodes : 0
/// status : "Finished Airing"
/// airing : true
/// aired : {"from":"string","to":"string","prop":{"from":{"day":0,"month":0,"year":0},"to":{"day":0,"month":0,"year":0},"string":"string"}}
/// duration : "string"
/// rating : "G - All Ages"
/// score : 0
/// scored_by : 0
/// rank : 0
/// popularity : 0
/// members : 0
/// favorites : 0
/// synopsis : "string"
/// background : "string"
/// season : "summer"
/// year : 0
/// broadcast : {"day":"string","time":"string","timezone":"string","string":"string"}
/// producers : [{"mal_id":0,"type":"string","name":"string","url":"string"}]
/// licensors : [{"mal_id":0,"type":"string","name":"string","url":"string"}]
/// studios : [{"mal_id":0,"type":"string","name":"string","url":"string"}]
/// genres : [{"mal_id":0,"type":"string","name":"string","url":"string"}]
/// explicit_genres : [{"mal_id":0,"type":"string","name":"string","url":"string"}]
/// themes : [{"mal_id":0,"type":"string","name":"string","url":"string"}]
/// demographics : [{"mal_id":0,"type":"string","name":"string","url":"string"}]
/// relations : [{"relation":"string","entry":[{"mal_id":0,"type":"string","name":"string","url":"string"}]}]
/// theme : {"openings":["string"],"endings":["string"]}
/// external : [{"name":"string","url":"string"}]
/// streaming : [{"name":"string","url":"string"}]

class Data {
  Data({
      num? malId, 
      String? url, 
      Images? images, 
      Trailer? trailer, 
      bool? approved, 
      List<Titles>? titles, 
      String? title, 
      String? titleEnglish, 
      String? titleJapanese, 
      List<String>? titleSynonyms, 
      String? type, 
      String? source, 
      num? episodes, 
      String? status, 
      bool? airing, 
      Aired? aired, 
      String? duration, 
      String? rating, 
      num? score, 
      num? scoredBy, 
      num? rank, 
      num? popularity, 
      num? members, 
      num? favorites, 
      String? synopsis, 
      String? background, 
      String? season, 
      num? year, 
      Broadcast? broadcast, 
      List<Producers>? producers, 
      List<Licensors>? licensors, 
      List<Studios>? studios, 
      List<Genres>? genres, 
      List<ExplicitGenres>? explicitGenres, 
      List<Themes>? themes, 
      List<Demographics>? demographics, 
      List<Relations>? relations, 
      Theme? theme, 
      List<External>? external, 
      List<Streaming>? streaming,}){
    _malId = malId;
    _url = url;
    _images = images;
    _trailer = trailer;
    _approved = approved;
    _titles = titles;
    _title = title;
    _titleEnglish = titleEnglish;
    _titleJapanese = titleJapanese;
    _titleSynonyms = titleSynonyms;
    _type = type;
    _source = source;
    _episodes = episodes;
    _status = status;
    _airing = airing;
    _aired = aired;
    _duration = duration;
    _rating = rating;
    _score = score;
    _scoredBy = scoredBy;
    _rank = rank;
    _popularity = popularity;
    _members = members;
    _favorites = favorites;
    _synopsis = synopsis;
    _background = background;
    _season = season;
    _year = year;
    _broadcast = broadcast;
    _producers = producers;
    _licensors = licensors;
    _studios = studios;
    _genres = genres;
    _explicitGenres = explicitGenres;
    _themes = themes;
    _demographics = demographics;
    _relations = relations;
    _theme = theme;
    _external = external;
    _streaming = streaming;
}

  Data.fromJson(dynamic json) {
    _malId = json['mal_id'];
    _url = json['url'];
    _images = json['images'] != null ? Images.fromJson(json['images']) : null;
    _trailer = json['trailer'] != null ? Trailer.fromJson(json['trailer']) : null;
    _approved = json['approved'];
    if (json['titles'] != null) {
      _titles = [];
      json['titles'].forEach((v) {
        _titles?.add(Titles.fromJson(v));
      });
    }
    _title = json['title'];
    _titleEnglish = json['title_english'];
    _titleJapanese = json['title_japanese'];
    _titleSynonyms = json['title_synonyms'] != null ? json['title_synonyms'].cast<String>() : [];
    _type = json['type'];
    _source = json['source'];
    _episodes = json['episodes'];
    _status = json['status'];
    _airing = json['airing'];
    _aired = json['aired'] != null ? Aired.fromJson(json['aired']) : null;
    _duration = json['duration'];
    _rating = json['rating'];
    _score = json['score'];
    _scoredBy = json['scored_by'];
    _rank = json['rank'];
    _popularity = json['popularity'];
    _members = json['members'];
    _favorites = json['favorites'];
    _synopsis = json['synopsis'];
    _background = json['background'];
    _season = json['season'];
    _year = json['year'];
    _broadcast = json['broadcast'] != null ? Broadcast.fromJson(json['broadcast']) : null;
    if (json['producers'] != null) {
      _producers = [];
      json['producers'].forEach((v) {
        _producers?.add(Producers.fromJson(v));
      });
    }
    if (json['licensors'] != null) {
      _licensors = [];
      json['licensors'].forEach((v) {
        _licensors?.add(Licensors.fromJson(v));
      });
    }
    if (json['studios'] != null) {
      _studios = [];
      json['studios'].forEach((v) {
        _studios?.add(Studios.fromJson(v));
      });
    }
    if (json['genres'] != null) {
      _genres = [];
      json['genres'].forEach((v) {
        _genres?.add(Genres.fromJson(v));
      });
    }
    if (json['explicit_genres'] != null) {
      _explicitGenres = [];
      json['explicit_genres'].forEach((v) {
        _explicitGenres?.add(ExplicitGenres.fromJson(v));
      });
    }
    if (json['themes'] != null) {
      _themes = [];
      json['themes'].forEach((v) {
        _themes?.add(Themes.fromJson(v));
      });
    }
    if (json['demographics'] != null) {
      _demographics = [];
      json['demographics'].forEach((v) {
        _demographics?.add(Demographics.fromJson(v));
      });
    }
    if (json['relations'] != null) {
      _relations = [];
      json['relations'].forEach((v) {
        _relations?.add(Relations.fromJson(v));
      });
    }
    _theme = json['theme'] != null ? Theme.fromJson(json['theme']) : null;
    if (json['external'] != null) {
      _external = [];
      json['external'].forEach((v) {
        _external?.add(External.fromJson(v));
      });
    }
    if (json['streaming'] != null) {
      _streaming = [];
      json['streaming'].forEach((v) {
        _streaming?.add(Streaming.fromJson(v));
      });
    }
  }
  num? _malId;
  String? _url;
  Images? _images;
  Trailer? _trailer;
  bool? _approved;
  List<Titles>? _titles;
  String? _title;
  String? _titleEnglish;
  String? _titleJapanese;
  List<String>? _titleSynonyms;
  String? _type;
  String? _source;
  num? _episodes;
  String? _status;
  bool? _airing;
  Aired? _aired;
  String? _duration;
  String? _rating;
  num? _score;
  num? _scoredBy;
  num? _rank;
  num? _popularity;
  num? _members;
  num? _favorites;
  String? _synopsis;
  String? _background;
  String? _season;
  num? _year;
  Broadcast? _broadcast;
  List<Producers>? _producers;
  List<Licensors>? _licensors;
  List<Studios>? _studios;
  List<Genres>? _genres;
  List<ExplicitGenres>? _explicitGenres;
  List<Themes>? _themes;
  List<Demographics>? _demographics;
  List<Relations>? _relations;
  Theme? _theme;
  List<External>? _external;
  List<Streaming>? _streaming;
Data copyWith({  num? malId,
  String? url,
  Images? images,
  Trailer? trailer,
  bool? approved,
  List<Titles>? titles,
  String? title,
  String? titleEnglish,
  String? titleJapanese,
  List<String>? titleSynonyms,
  String? type,
  String? source,
  num? episodes,
  String? status,
  bool? airing,
  Aired? aired,
  String? duration,
  String? rating,
  num? score,
  num? scoredBy,
  num? rank,
  num? popularity,
  num? members,
  num? favorites,
  String? synopsis,
  String? background,
  String? season,
  num? year,
  Broadcast? broadcast,
  List<Producers>? producers,
  List<Licensors>? licensors,
  List<Studios>? studios,
  List<Genres>? genres,
  List<ExplicitGenres>? explicitGenres,
  List<Themes>? themes,
  List<Demographics>? demographics,
  List<Relations>? relations,
  Theme? theme,
  List<External>? external,
  List<Streaming>? streaming,
}) => Data(  malId: malId ?? _malId,
  url: url ?? _url,
  images: images ?? _images,
  trailer: trailer ?? _trailer,
  approved: approved ?? _approved,
  titles: titles ?? _titles,
  title: title ?? _title,
  titleEnglish: titleEnglish ?? _titleEnglish,
  titleJapanese: titleJapanese ?? _titleJapanese,
  titleSynonyms: titleSynonyms ?? _titleSynonyms,
  type: type ?? _type,
  source: source ?? _source,
  episodes: episodes ?? _episodes,
  status: status ?? _status,
  airing: airing ?? _airing,
  aired: aired ?? _aired,
  duration: duration ?? _duration,
  rating: rating ?? _rating,
  score: score ?? _score,
  scoredBy: scoredBy ?? _scoredBy,
  rank: rank ?? _rank,
  popularity: popularity ?? _popularity,
  members: members ?? _members,
  favorites: favorites ?? _favorites,
  synopsis: synopsis ?? _synopsis,
  background: background ?? _background,
  season: season ?? _season,
  year: year ?? _year,
  broadcast: broadcast ?? _broadcast,
  producers: producers ?? _producers,
  licensors: licensors ?? _licensors,
  studios: studios ?? _studios,
  genres: genres ?? _genres,
  explicitGenres: explicitGenres ?? _explicitGenres,
  themes: themes ?? _themes,
  demographics: demographics ?? _demographics,
  relations: relations ?? _relations,
  theme: theme ?? _theme,
  external: external ?? _external,
  streaming: streaming ?? _streaming,
);
  num? get malId => _malId;
  String? get url => _url;
  Images? get images => _images;
  Trailer? get trailer => _trailer;
  bool? get approved => _approved;
  List<Titles>? get titles => _titles;
  String? get title => _title;
  String? get titleEnglish => _titleEnglish;
  String? get titleJapanese => _titleJapanese;
  List<String>? get titleSynonyms => _titleSynonyms;
  String? get type => _type;
  String? get source => _source;
  num? get episodes => _episodes;
  String? get status => _status;
  bool? get airing => _airing;
  Aired? get aired => _aired;
  String? get duration => _duration;
  String? get rating => _rating;
  num? get score => _score;
  num? get scoredBy => _scoredBy;
  num? get rank => _rank;
  num? get popularity => _popularity;
  num? get members => _members;
  num? get favorites => _favorites;
  String? get synopsis => _synopsis;
  String? get background => _background;
  String? get season => _season;
  num? get year => _year;
  Broadcast? get broadcast => _broadcast;
  List<Producers>? get producers => _producers;
  List<Licensors>? get licensors => _licensors;
  List<Studios>? get studios => _studios;
  List<Genres>? get genres => _genres;
  List<ExplicitGenres>? get explicitGenres => _explicitGenres;
  List<Themes>? get themes => _themes;
  List<Demographics>? get demographics => _demographics;
  List<Relations>? get relations => _relations;
  Theme? get theme => _theme;
  List<External>? get external => _external;
  List<Streaming>? get streaming => _streaming;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mal_id'] = _malId;
    map['url'] = _url;
    if (_images != null) {
      map['images'] = _images?.toJson();
    }
    if (_trailer != null) {
      map['trailer'] = _trailer?.toJson();
    }
    map['approved'] = _approved;
    if (_titles != null) {
      map['titles'] = _titles?.map((v) => v.toJson()).toList();
    }
    map['title'] = _title;
    map['title_english'] = _titleEnglish;
    map['title_japanese'] = _titleJapanese;
    map['title_synonyms'] = _titleSynonyms;
    map['type'] = _type;
    map['source'] = _source;
    map['episodes'] = _episodes;
    map['status'] = _status;
    map['airing'] = _airing;
    if (_aired != null) {
      map['aired'] = _aired?.toJson();
    }
    map['duration'] = _duration;
    map['rating'] = _rating;
    map['score'] = _score;
    map['scored_by'] = _scoredBy;
    map['rank'] = _rank;
    map['popularity'] = _popularity;
    map['members'] = _members;
    map['favorites'] = _favorites;
    map['synopsis'] = _synopsis;
    map['background'] = _background;
    map['season'] = _season;
    map['year'] = _year;
    if (_broadcast != null) {
      map['broadcast'] = _broadcast?.toJson();
    }
    if (_producers != null) {
      map['producers'] = _producers?.map((v) => v.toJson()).toList();
    }
    if (_licensors != null) {
      map['licensors'] = _licensors?.map((v) => v.toJson()).toList();
    }
    if (_studios != null) {
      map['studios'] = _studios?.map((v) => v.toJson()).toList();
    }
    if (_genres != null) {
      map['genres'] = _genres?.map((v) => v.toJson()).toList();
    }
    if (_explicitGenres != null) {
      map['explicit_genres'] = _explicitGenres?.map((v) => v.toJson()).toList();
    }
    if (_themes != null) {
      map['themes'] = _themes?.map((v) => v.toJson()).toList();
    }
    if (_demographics != null) {
      map['demographics'] = _demographics?.map((v) => v.toJson()).toList();
    }
    if (_relations != null) {
      map['relations'] = _relations?.map((v) => v.toJson()).toList();
    }
    if (_theme != null) {
      map['theme'] = _theme?.toJson();
    }
    if (_external != null) {
      map['external'] = _external?.map((v) => v.toJson()).toList();
    }
    if (_streaming != null) {
      map['streaming'] = _streaming?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}