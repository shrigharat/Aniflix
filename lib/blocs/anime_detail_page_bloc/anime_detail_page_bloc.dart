import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:AniFlix/blocs/anime_detail_page_bloc/anime_detail_page_events.dart';
import 'package:AniFlix/blocs/anime_detail_page_bloc/anime_detail_page_state.dart';

import 'package:AniFlix/helpers/fetcher.dart';

class AnimeDetailPageBloc
    extends Bloc<AnimeDetailPageEvent, AnimeDetailPageState> {
  AnimeDetailPageBloc() : super(AnimeDetailPageState.initial());

  @override
  void onChange(Change<AnimeDetailPageState> change) {
    print(change);
    // print({
    //   'currentState': {
    //     'animeDetails': change.currentState.animeDetails,
    //     'animeRecommendations': change.currentState.animeRecommendationsList,
    //     'animeImgUrl': change.currentState.animeImgUrl,
    //   },
    //   'nextState': {
    //     'animeDetails': change.nextState.animeDetails,
    //     'animeRecommendations': change.nextState.animeRecommendationsList,
    //     'animeImgUrl': change.nextState.animeImgUrl,
    //   },
    // }.toString());
    super.onChange(change);
  }

  @override
  Stream<AnimeDetailPageState> mapEventToState(
      AnimeDetailPageEvent event) async* {
    if (event is FetchAnimeDetailsEvent) {
      state.animeDetails = await Fetcher.animeFetcher(event.animeId);
      state.animeEpisodesList =
          await Fetcher.animeEpisodesFetcher(event.animeId);
      state.animeRecommendationsList =
          await Fetcher.animeRecommendationsFetcher(url: 'https://api.jikan.moe/v3/anime/${event.animeId}/recommendations', param: 'recommendations');
      state.animeImgUrl = await Fetcher.animeImageStringFetcher(event.animeId);
    }

    yield state;
  }
}
