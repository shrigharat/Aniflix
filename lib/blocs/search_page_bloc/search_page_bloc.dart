import 'package:AniFlix/blocs/search_page_bloc/search_page_events.dart';
import 'package:AniFlix/blocs/search_page_bloc/search_page_state.dart';
import 'package:AniFlix/helpers/fetcher.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPageBloc extends Bloc<SearchPageEvent, SearchPageState> {

  SearchPageBloc() : super(SearchPageState.initial());

  @override
  Stream<SearchPageState> mapEventToState(SearchPageEvent event) async* {
    SearchPageState newState = SearchPageState.initial();
    if(event is FetchGenreAnimeEvent) {
      newState.animeList = await Fetcher.animeRecommendationsFetcher(url: 'https://api.jikan.moe/v3/genre/anime/${event.genreId}', param: 'anime');
    } else if(event is FetchSearchedAnimeEvent) {
      newState.animeList = await Fetcher.animeRecommendationsFetcher(url: 'https://api.jikan.moe/v3/search/anime?q=${event.animeName}', param: 'results');
    }

    yield newState;
  }

}