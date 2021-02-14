import 'package:AniFlix/components/anime_detail_component/anime_detail_image_component.dart';
import 'package:AniFlix/models/Anime.dart';
import 'package:flutter/material.dart';

class AnimeDetailPage extends StatelessWidget {
  final Anime anime;

  AnimeDetailPage({this.anime});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AnimeDetailImage(),
      ],
    );
  }
}
