import 'package:AniFlix/constants.dart';
import 'package:AniFlix/models/Anime.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:AniFlix/components/anime_component.dart/anime_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteAnime = Hive.box('favorite_anime');

    void removeFromFavorites(index) {
      Hive.box('favorite_anime').deleteAt(index);
    }

    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
              child: Text(
                'Favorites',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 70.0,),
                child: ValueListenableBuilder(
                  valueListenable: favoriteAnime.listenable(),
                  builder: (BuildContext context, Box box, Widget _) {
                    if (box.values.isEmpty) {
                      return Center(child: Text('No favorites here'));
                    }
                    return ListView.builder(
                      itemCount: box.values.length,
                      itemBuilder: (BuildContext context, int index) {
                        return AnimeTile(
                          anime: box.getAt(index) as Anime,
                          onTap: () => removeFromFavorites(index),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
