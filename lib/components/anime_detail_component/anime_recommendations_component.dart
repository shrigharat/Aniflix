import 'package:AniFlix/components/anime_component.dart/anime_card.dart';
import 'package:AniFlix/components/anime_component.dart/anime_tile.dart';
import 'package:AniFlix/components/anime_detail_component/anime_detail_genre_component.dart';
import 'package:AniFlix/models/Anime.dart';
import 'package:flutter/material.dart';

class AnimeRecommendationsComponent extends StatelessWidget {

  final List<Anime> animeList;

  const AnimeRecommendationsComponent({this.animeList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        childAspectRatio: 2/3,
        maxCrossAxisExtent: 200,
      ),
      itemCount: animeList.length,
      itemBuilder: (BuildContext context, int index) {
        print('Tab 3 view build called');
        return AnimeCard(
          anime: animeList[index],
        );
      },
    );
  }
}
