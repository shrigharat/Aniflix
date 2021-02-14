import 'package:AniFlix/blocs/homepage_bloc/homepage_bloc.dart';
import 'package:AniFlix/blocs/homepage_bloc/homepage_constants.dart';
import 'package:AniFlix/blocs/homepage_bloc/homepage_events.dart';
import 'package:AniFlix/blocs/homepage_bloc/homepage_state.dart';
import 'package:AniFlix/models/Anime.dart';
import 'package:flutter/material.dart';

import 'package:AniFlix/components/horizontal_anime_list_component/horizontal_anime_list.dart';
import 'package:AniFlix/components/carousel/carousel_component.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeBloc = HomePageBloc();

  @override
  void initState() {
    _homeBloc.add(FetchAnimeListEvent(listType: HomePageListNames.byPopularityList));
    _homeBloc.add(FetchAnimeListEvent(listType: HomePageListNames.upComingList));
    _homeBloc.add(FetchAnimeListEvent(listType: HomePageListNames.movieList));
    _homeBloc.add(FetchAnimeListEvent(listType: HomePageListNames.byPopularityList));
    super.initState();
  }

  @override
  void dispose() {
    _homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Home page build was called');

    return BlocBuilder(
      cubit: _homeBloc,
      builder: (BuildContext context, HomePageState state) {
        return ListView(
          children: [
            Carousel(),
            HorizontalAnimeList(
              sectionTitle: 'Popular',
              listType: HomePageListNames.byPopularityList,
              animeList: state.popularList,
            ),
            HorizontalAnimeList(
              sectionTitle: 'Upcoming',
              listType: HomePageListNames.upComingList,
              animeList: state.upcomingList,
            ),
            HorizontalAnimeList(
              sectionTitle: 'Movies',
              listType: HomePageListNames.movieList,
              animeList: state.movieList,
            ),
          ],
        );
      },
    );
  }
}
