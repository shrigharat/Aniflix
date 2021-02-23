import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:AniFlix/blocs/anime_detail_page_bloc/anime_detail_page_bloc.dart';
import 'package:AniFlix/blocs/anime_detail_page_bloc/anime_detail_page_events.dart';
import 'package:AniFlix/blocs/anime_detail_page_bloc/anime_detail_page_state.dart';

import 'package:AniFlix/components/anime_detail_component/anime_episodes_component.dart';
import 'package:AniFlix/components/anime_detail_component/anime_info_component.dart';
import 'package:AniFlix/components/anime_detail_component/anime_recommendations_component.dart';
import 'package:AniFlix/components/loading_component/loading.dart';

import 'package:AniFlix/constants.dart';


class AnimeDetailPage extends StatefulWidget {
  final int animeId;

  AnimeDetailPage({@required this.animeId});

  @override
  _AnimeDetailPageState createState() => _AnimeDetailPageState();
}

class _AnimeDetailPageState extends State<AnimeDetailPage> {
  final _animeDetailbloc = AnimeDetailPageBloc();

  @override
  void initState() {
    _animeDetailbloc.add(FetchAnimeDetailsEvent(animeId: widget.animeId));
    super.initState();
  }

  @override
  void dispose() {
    _animeDetailbloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle tStyle = TextStyle(color: Colors.white, fontSize: 18);
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: TabBar(
            tabs: [
              Tab(text: 'Info'),
              Tab(text: 'Episodes'),
              Tab(text: 'Similar'),
            ],
            labelColor: Colors.blue[900],
          ),
          backgroundColor: kScaffoldBackgroundColor,
          body: BlocBuilder(
            cubit: _animeDetailbloc,
            builder: (BuildContext context, AnimeDetailPageState state) {
              return state.animeDetails == null
                  ? Loading(
                      loadingMessage: 'Loading...',
                    )
                  : TabBarView(
                      children: <Widget>[
                        AnimeInfoComponent(
                          anime: state.animeDetails,
                          animeImgUrl: state.animeImgUrl,
                        ),
                        AnimeEpisodesComponent(
                          episodeList: state.animeEpisodesList,
                        ),
                        AnimeRecommendationsComponent(
                          animeList: state.animeRecommendationsList,
                        ),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }
}
