import 'package:flutter/material.dart';

import 'package:AniFlix/pages/anime_detail_page.dart';

import 'package:AniFlix/models/Anime.dart';


class AnimeCard extends StatelessWidget {
  final Anime anime;

  AnimeCard({this.anime});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AnimeDetailPage(animeId: anime.id),
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(8),
        height: 210,
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          height: 150,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(
                anime.imgUrl,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.transparent, Colors.black],
              ),
            ),
            child: Container(
              width: 140,
              height: 210,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    child: Text(
                      anime.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
