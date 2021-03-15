import 'package:flutter/material.dart';

import 'package:AniFlix/components/anime_detail_component/anime_detail_genre_component.dart';

import 'package:AniFlix/models/Anime.dart';
import 'package:AniFlix/constants.dart';

class AnimeTile extends StatelessWidget {
  final Anime anime;
  final onTap;


  AnimeTile({this.anime, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(8, 14, 8, 0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kMyBlueColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 11,
                child: Text(
                  anime.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    height: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: onTap,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          GenreComponent(
            genreList: anime.genres.length > 3 ? anime.genres.sublist(0, 3) : anime.genres,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Status : ${anime.status}',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Text(
                    anime.score == null ? '-' : anime.score.toString(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
