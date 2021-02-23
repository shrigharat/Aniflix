import 'package:AniFlix/blocs/search_page_bloc/search_page_bloc.dart';
import 'package:AniFlix/blocs/search_page_bloc/search_page_events.dart';
import 'package:AniFlix/blocs/search_page_bloc/search_page_state.dart';
import 'package:AniFlix/components/anime_detail_component/anime_recommendations_component.dart';
import 'package:AniFlix/constants.dart';
import 'package:flutter/material.dart';

import 'package:AniFlix/components/search_page_component/serach_page_result.component.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class SearchPage extends StatelessWidget {
  SearchPageBloc _searchPageBloc = SearchPageBloc();
  TextEditingController _searchFieldController = TextEditingController();

  void _onGenreTileTap(int genreId) {
    _searchPageBloc.add(FetchGenreAnimeEvent(genreId: genreId));
  }

  @override
  Widget build(BuildContext context) {
    print('Search page was built!');
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      body: Container(
        padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: TextFormField(
                        controller: _searchFieldController,
                        decoration: InputDecoration(
                          hintText: 'Search anime',
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(
                          Icons.search,
                          size: 24,
                          color: Colors.blue[600],
                        ),
                        onPressed: () {
                          _searchPageBloc.add(FetchSearchedAnimeEvent(
                              animeName: _searchFieldController.text));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            BlocBuilder(
              cubit: _searchPageBloc,
              builder: (BuildContext context, SearchPageState state) {
                return state.animeList.isEmpty
                    ? SearchPageResultContainer(onGridItemTap: _onGenreTileTap,)
                    : Expanded(
                        flex: 10,
                        child: Container(
                          child: AnimeRecommendationsComponent(
                            animeList: state.animeList,
                          ),
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
