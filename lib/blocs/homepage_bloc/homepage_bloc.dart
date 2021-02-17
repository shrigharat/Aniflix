import 'dart:async';

import 'package:AniFlix/blocs/homepage_bloc/homepage_constants.dart';
import 'package:AniFlix/blocs/homepage_bloc/homepage_events.dart';
import 'package:AniFlix/blocs/homepage_bloc/homepage_state.dart';
import 'package:AniFlix/helpers/fetcher.dart';
import 'package:AniFlix/models/Anime.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageState.initial());

  Future<List<Anime>> fetchAnimeList(String listType) async {
    print('FetchAnimeList event of type $listType was received !!!');
    String url = 'https://api.jikan.moe/v3/top/anime/1/$listType';
    return Fetcher.topAnimeListFetcher(url);
  }

  @override
  void onChange(Change<HomePageState> change) {
    print(change);
    super.onChange(change);
//    {
//      'currentState': {
//    'bypopularity': change.currentState.popularList,
//    'upcoming': change.currentState.upcomingList,
//    'movie': change.currentState.movieList,
//    },
//    'nextState': {
//    'bypopularity': change.nextState.popularList,
//    'upcoming': change.nextState.upcomingList,
//    'movie': change.nextState.movieList,
//    }
//  }
  }

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    HomePageState newState = HomePageState.initial()
      ..popularList = state.popularList
      ..upcomingList = state.upcomingList
      ..movieList = state.movieList;

    if (event is FetchAnimeListEvent) {
      switch (event.listType) {
        case HomePageListNames.byPopularityList:
          newState.popularList = await fetchAnimeList(event.listType);
          break;
        case HomePageListNames.upComingList:
          newState.upcomingList = await fetchAnimeList(event.listType);
          break;
        case HomePageListNames.movieList:
          newState.movieList = await fetchAnimeList(event.listType);
          break;
      }
    }
    yield newState;
  }
}
