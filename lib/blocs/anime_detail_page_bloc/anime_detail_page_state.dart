import 'package:AniFlix/models/Anime.dart';
import 'package:AniFlix/models/episode.dart';

class AnimeDetailPageState {
  Anime animeDetails;
  List<Episode> animeEpisodesList;
  List<Anime> animeRecommendationsList;
  String animeImgUrl;

  AnimeDetailPageState._();

  factory AnimeDetailPageState.initial() {
    return AnimeDetailPageState._()
      ..animeDetails = null
      ..animeEpisodesList = []
      ..animeRecommendationsList = []
      ..animeImgUrl = '';
  }
}
