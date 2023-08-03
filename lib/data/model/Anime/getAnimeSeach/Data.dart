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

class Data {
  Data({
    this.malId,
    this.url,
    this.images,
    this.trailer,
    this.approved,
    this.titles,
    this.title,
    this.titleEnglish,
    this.titleJapanese,
    this.titleSynonyms,
    this.type,
    this.source,
    this.episodes,
    this.status,
    this.airing,
    this.aired,
    this.duration,
    this.rating,
    this.score,
    this.scoredBy,
    this.rank,
    this.popularity,
    this.members,
    this.favorites,
    this.synopsis,
    this.background,
    this.season,
    this.year,
    this.broadcast,
    this.producers,
    this.licensors,
    this.studios,
    this.genres,
    this.explicitGenres,
    this.themes,
    this.demographics,
  });

  Data.fromJson(dynamic json) {
    malId = json['mal_id'];
    url = json['url'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    trailer =
        json['trailer'] != null ? Trailer.fromJson(json['trailer']) : null;
    approved = json['approved'];
    if (json['titles'] != null) {
      titles = [];
      json['titles'].forEach((v) {
        titles!.add(Titles.fromJson(v));
      });
    }
    title = json['title'];
    titleEnglish = json['title_english'];
    titleJapanese = json['title_japanese'];
    titleSynonyms = json['title_synonyms'] != null
        ? json['title_synonyms'].cast<String>()
        : [];
    type = json['type'];
    source = json['source'];
    episodes = json['episodes'];
    status = json['status'];
    airing = json['airing'];
    aired = json['aired'] != null ? Aired.fromJson(json['aired']) : null;
    duration = json['duration'];
    rating = json['rating'];
    score = json['score'];
    scoredBy = json['scored_by'];
    rank = json['rank'];
    popularity = json['popularity'];
    members = json['members'];
    favorites = json['favorites'];
    synopsis = json['synopsis'];
    background = json['background'];
    season = json['season'];
    year = json['year'];
    broadcast = json['broadcast'] != null
        ? Broadcast.fromJson(json['broadcast'])
        : null;
    if (json['producers'] != null) {
      producers = [];
      json['producers'].forEach((v) {
        producers!.add(Producers.fromJson(v));
      });
    }
    if (json['licensors'] != null) {
      licensors = [];
      json['licensors'].forEach((v) {
        licensors!.add(Licensors.fromJson(v));
      });
    }
    if (json['studios'] != null) {
      studios = [];
      json['studios'].forEach((v) {
        studios!.add(Studios.fromJson(v));
      });
    }
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres!.add(Genres.fromJson(v));
      });
    }
    if (json['explicit_genres'] != null) {
      explicitGenres = [];
      json['explicit_genres'].forEach((v) {
        explicitGenres!.add(ExplicitGenres.fromJson(v));
      });
    }
    if (json['themes'] != null) {
      themes = [];
      json['themes'].forEach((v) {
        themes!.add(Themes.fromJson(v));
      });
    }
    if (json['demographics'] != null) {
      demographics = [];
      json['demographics'].forEach((v) {
        demographics!.add(Demographics.fromJson(v));
      });
    }
  }
  int? malId;
  String? url;
  Images? images;
  Trailer? trailer;
  bool? approved;
  List<Titles>? titles;
  String? title;
  String? titleEnglish;
  String? titleJapanese;
  List<String>? titleSynonyms;
  String? type;
  String? source;
  int? episodes;
  String? status;
  bool? airing;
  Aired? aired;
  String? duration;
  String? rating;
  double? score;
  int? scoredBy;
  int? rank;
  int? popularity;
  int? members;
  int? favorites;
  String? synopsis;
  String? background;
  String? season;
  int? year;
  Broadcast? broadcast;
  List<Producers>? producers;
  List<Licensors>? licensors;
  List<Studios>? studios;
  List<Genres>? genres;
  List<ExplicitGenres>? explicitGenres;
  List<Themes>? themes;
  List<Demographics>? demographics;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mal_id'] = malId;
    map['url'] = url;
    if (images != null) {
      map['images'] = images!.toJson();
    }
    if (trailer != null) {
      map['trailer'] = trailer!.toJson();
    }
    map['approved'] = approved;
    if (titles != null) {
      map['titles'] = titles!.map((v) => v.toJson()).toList();
    }
    map['title'] = title;
    map['title_english'] = titleEnglish;
    map['title_japanese'] = titleJapanese;
    map['title_synonyms'] = titleSynonyms;
    map['type'] = type;
    map['source'] = source;
    map['episodes'] = episodes;
    map['status'] = status;
    map['airing'] = airing;
    if (aired != null) {
      map['aired'] = aired!.toJson();
    }
    map['duration'] = duration;
    map['rating'] = rating;
    map['score'] = score;
    map['scored_by'] = scoredBy;
    map['rank'] = rank;
    map['popularity'] = popularity;
    map['members'] = members;
    map['favorites'] = favorites;
    map['synopsis'] = synopsis;
    map['background'] = background;
    map['season'] = season;
    map['year'] = year;
    if (broadcast != null) {
      map['broadcast'] = broadcast!.toJson();
    }
    if (producers != null) {
      map['producers'] = producers!.map((v) => v.toJson()).toList();
    }
    if (licensors != null) {
      map['licensors'] = licensors!.map((v) => v.toJson()).toList();
    }
    if (studios != null) {
      map['studios'] = studios!.map((v) => v.toJson()).toList();
    }
    if (genres != null) {
      map['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    if (explicitGenres != null) {
      map['explicit_genres'] = explicitGenres!.map((v) => v.toJson()).toList();
    }
    if (themes != null) {
      map['themes'] = themes!.map((v) => v.toJson()).toList();
    }
    if (demographics != null) {
      map['demographics'] = demographics!.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
