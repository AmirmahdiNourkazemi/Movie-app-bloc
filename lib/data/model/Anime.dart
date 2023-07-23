import 'package:movie_app/data/model/title.dart';
import 'package:movie_app/data/model/trailer.dart';

import 'image.dart';

class Anime {
  final int malId;
  final String url;
  final Images images;
  final Trailer trailer;
  final bool approved;
  final List<Title> titles;
  final String title;
  final String titleEnglish;
  final String titleJapanese;
  final List<String> titleSynonyms;
  final String type;
  final String source;
  final int episodes;
  final String status;
  final bool airing;
  //final Aired aired;
  final String duration;
  final String rating;
  final double score;
  final int scoredBy;
  final int rank;
  final int popularity;
  final int members;
  final int favorites;
  final String synopsis;
  final String? background;
  final String season;
  final int year;
  // final Broadcast broadcast;
  // final List<Producer> producers;
  // final List<Producer> licensors;
  // final List<Producer> studios;
  // final List<Genre> genres;
  // final List<Genre> explicitGenres;
  // final List<Genre> themes;
  // final List<Genre> demographics;

  Anime({
    required this.malId,
    required this.url,
    required this.images,
    required this.trailer,
    required this.approved,
    required this.titles,
    required this.title,
    required this.titleEnglish,
    required this.titleJapanese,
    required this.titleSynonyms,
    required this.type,
    required this.source,
    required this.episodes,
    required this.status,
    required this.airing,
    //required this.aired,
    required this.duration,
    required this.rating,
    required this.score,
    required this.scoredBy,
    required this.rank,
    required this.popularity,
    required this.members,
    required this.favorites,
    required this.synopsis,
    required this.background,
    required this.season,
    required this.year,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      malId: json['mal_id'],
      url: json['url'],
      images: Images.fromJson(json['images']),
      trailer: Trailer.fromJson(json['trailer']),
      approved: json['approved'],
      titles: List<Title>.from(json['titles'].map((x) => Title.fromJson(x))),
      title: json['title'],
      titleEnglish: json['title_english'],
      titleJapanese: json['title_japanese'],
      titleSynonyms: List<String>.from(json['title_synonyms'].map((x) => x)),
      type: json['type'],
      source: json['source'],
      episodes: json['episodes'],
      status: json['status'],
      airing: json['airing'],
// aired: Aired.fromJson(json['aired']),
      duration: json['duration'],
      rating: json['rating'],
      score: json['score'].toDouble(),
      scoredBy: json['scored_by'],
      rank: json['rank'],
      popularity: json['popularity'],
      members: json['members'],
      favorites: json['favorites'],
      synopsis: json['synopsis'],
      background: json['background'],
      season: json['season'],
      year: json['year'],
// broadcast: Broadcast.fromJson(json['broadcast']),
// producers:
// List<Producer>.from(json['producers'].map((x) => Producer.fromJson(x))),
// licensors:
// List<Producer>.from(json['licensors'].map((x) => Producer.fromJson(x))),
// studios:
// List<Producer>.from(json['studios'].map((x) => Producer.fromJson(x))),
// genres:
// List<Genre>.from(json['genres'].map((x) => Genre.fromJson(x))),
// explicitGenres:
// List<Genre>.from(json['explicit_genres'].map((x) => Genre.fromJson(x))),
// themes:
// List<Genre>.from(json['themes'].map((x) => Genre.fromJson(x))),
// demographics:
// List<Genre>.from(json['demographics'].map((x) => Genre.fromJson(x)))
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mal_id': malId,
      'url': url,
      'images': images.toJson(),
      'trailer': trailer.toJson(),
      'approved': approved,
      'titles': titles.map((x) => x.toJson()).toList(),
      'title': title,
      'title_english': titleEnglish,
      'title_japanese': titleJapanese,
      'title_synonyms': titleSynonyms.map((x) => x).toList(),
      'type': type,
      'source': source,
      'episodes': episodes,
      'status': status,
      'airing': airing,
//'aired': aired.toJson(),
      'duration': duration,
      'rating': rating,
      'score': score,
      'scored_by': scoredBy,
      'rank': rank,
      'popularity': popularity,
      'members': members,
      'favorites': favorites,
      'synopsis': synopsis,
      'background': background,
      'season': season,
      'year': year,
// 'broadcast': broadcast.toJson(),
// 'producers': producers.map((x) => x.toJson()).toList(),
// 'licensors': licensors.map((x) => x.toJson()).toList(),
// 'studios': studios.map((x) => x.toJson()).toList(),
// 'genres': genres.map((x) => x.toJson()).toList(),
// 'explicit_genres': explicitGenres.map((x) => x.toJson()).toList(),
// 'themes': themes.map((x) => x.toJson()).toList(),
// 'demographics': demographics.map((x) => x.toJson()).toList()
    };
  }
}
