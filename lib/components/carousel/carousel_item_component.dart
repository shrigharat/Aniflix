import 'package:AniFlix/components/carousel/carousel_indicator_component.dart';
import 'package:AniFlix/models/Anime.dart';
import 'package:AniFlix/pages/anime_detail_page.dart';
import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  final Anime item;
  final CarouselIndicator carouselIndicator;

  CarouselItem({this.item, this.carouselIndicator});

  @override
  Widget build(BuildContext context) {
    AssetImage img = AssetImage(item.imgUrl);
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AnimeDetailPage(
            animeId: item.id,
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: img,
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.transparent, Colors.black],
            ),
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    item.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                carouselIndicator,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
