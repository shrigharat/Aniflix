import 'package:flutter/material.dart';

import 'package:AniFlix/components/loading_component/loading.dart';

import 'package:AniFlix/models/Anime.dart';

import '../anime_component.dart/anime_card.dart';

class HorizontalAnimeList extends StatelessWidget {
  final String listType;
  final String sectionTitle;
  final List<Anime> animeList;

  HorizontalAnimeList({this.listType, this.sectionTitle, this.animeList});

  @override
  Widget build(BuildContext context) {
    print('Horizontal $listType list build was called');

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      width: double.infinity,
      height: 270,
//      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: Text(
              sectionTitle,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            height: 230,
            width: double.infinity,
            child: animeList.isEmpty
                ? Loading(
              loadingMessage: 'Loading...',
            )
                : ListView.builder(
              itemCount: animeList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return AnimeCard(
                  anime: animeList[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
