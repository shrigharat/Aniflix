class Anime {
  final int id;
  final String imgUrl;
  final String title;
  final String titleJapanese;
  final String source;
  final String type;
  final String status;
  final String synopsis;

  Anime({
    this.id,
    this.imgUrl,
    this.source,
    this.status,
    this.synopsis,
    this.title,
    this.titleJapanese,
    this.type,
  });

  factory Anime.fromJSON(Map<String, dynamic> json) {
    return Anime(
      id: json['mal_id'],
      imgUrl: json['image_url'],
      title: json['title'],
      titleJapanese: json['title_japanese'],
      type: json['type'],
      source: json['source'],
      status: json['status'],
      synopsis: json['synopsis']
    );
  }
}
