abstract class AnimeDetailPageEvent{}

class FetchAnimeDetailsEvent extends AnimeDetailPageEvent{
  final int animeId;

  FetchAnimeDetailsEvent({this.animeId});
}