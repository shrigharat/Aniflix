import 'package:flutter/material.dart';

import 'package:AniFlix/models/Anime.dart';
import 'package:hive/hive.dart';

import 'anime_detail_genre_component.dart';
import 'anime_detail_image_component.dart';
import 'anime_detail_synopsis_component.dart';

class AnimeInfoComponent extends StatelessWidget {
  final Anime anime;
  final String animeImgUrl;

  AnimeInfoComponent({this.anime, this.animeImgUrl});

  void addToFavorites() {
    final favoritesBox = Hive.box('favorite_anime');
    favoritesBox.add(anime);
    print('${anime.title} was added to the database! Yayyyyyy!');
  }

  @override
  Widget build(BuildContext context) {
    print('Tab 1 view build called');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          AnimeDetailImage(
            addToFavorites: addToFavorites,
            imgUrl: animeImgUrl,
            title: anime.title,
          ),
          GenreComponent(
            genreList: anime.genres,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
            ),
            child: Text(
              'Other titles: ${anime.titleJapanese}',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Airing status : ${airingStatus(anime.airing)}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Score: ${anime.score}',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SynopsisComponent(synopsis: anime.synopsis),
        ],
      ),
    );
  }

  String airingStatus(String isAiring) {
    switch (isAiring) {
      case 'null':
        return '?';
      case 'false':
        return 'Not airing';
      case 'true':
        return 'Currently airing';
      default:
        return '?';
    }
  }
}
