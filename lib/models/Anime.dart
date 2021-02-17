class Anime {
  final int id;
  final String imgUrl;
  final String title;
  final String titleJapanese;
  final String source;
  final String airing;
  final String type;
  final String status;
  final String synopsis;
  final double score;
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
