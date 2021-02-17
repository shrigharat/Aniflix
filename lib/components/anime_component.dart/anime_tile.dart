import 'package:AniFlix/components/anime_detail_component/anime_detail_genre_component.dart';
import 'package:flutter/material.dart';

import 'package:AniFlix/models/Anime.dart';

class AnimeTile extends StatelessWidget {
  final Anime anime;

  AnimeTile({this.anime});

  @override
  Widget build(BuildContext context) {
    print(anime);
    return Container(
          height: 150,
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(8, 14, 8, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.blue[900],
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          anime.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            height: 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      // Expanded(
                      //   flex: 1,
                      //   child: Text(
                      //     anime.synopsis.length > 80
                      //         ? anime.synopsis.substring(0, 50)
                      //         : anime.synopsis,
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 14,
                      //     ),
                      //   ),
                      // ),
                      // Expanded(
                      //   flex: 1,
                      //   child: GenreComponent(
                      //     genreList: anime.genres.sublist(0, 2),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.network(
                      anime.imgUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
  }
}