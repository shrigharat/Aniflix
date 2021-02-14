import 'Anime.dart';

class AnimeList{
  final List<Anime> results;

  AnimeList({this.results});

  factory AnimeList.fromJSON(List<dynamic> response) {
    List<Anime> animeList = [];
    response.forEach((v) {
      animeList.add(Anime.fromJSON(v));
    });
    return AnimeList(results: animeList.sublist(0, 12));
  }
}