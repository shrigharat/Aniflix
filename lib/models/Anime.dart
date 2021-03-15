import 'package:hive/hive.dart';

part 'Anime.g.dart';

@HiveType(typeId: 101)
class Anime {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String imgUrl;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String titleJapanese;
  @HiveField(4)
  final String source;
  @HiveField(5)
  final String airing;
  @HiveField(6)
  final String type;
  @HiveField(7)
  final String status;
  @HiveField(8)
  final String synopsis;
  @HiveField(9)
  final double score;
  @HiveField(10)
  final List<String> genres;

  Anime({
    this.id,
    this.imgUrl,
    this.source,
    this.status,
    this.synopsis,
    this.title,
    this.airing,
    this.titleJapanese,
    this.type,
    this.genres,
    this.score,
  });

  static List<String> getGenreFromJSON(List<dynamic> genres) {
    List<String> stringGenres = [];
    for (int i = 0; i < genres.length; i++) {
      stringGenres.add(genres[i]['name']);
    }
    return stringGenres;
  }

  factory Anime.fromJSON(Map<String, dynamic> json) {
    return Anime(
      id: json['mal_id'],
      imgUrl: json['image_url'],
      title: json['title'],
      titleJapanese: json['title_japanese'],
      type: json['type'],
      source: json['source'],
      status: json['status'],
      synopsis: json['synopsis'],
      airing: json['airing'].toString(),
      genres: json['genres'] == null ? null : getGenreFromJSON(json['genres']),
      score: json['score'] == null ? null : json['score'] + 0.0,
    );
  }
}
