import 'package:flutter/material.dart';

class GenreComponent extends StatelessWidget {
  List<String> genreList;

  GenreComponent({this.genreList});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      runSpacing: -4,
      children: genreList
          .map(
            (genre) => Chip(
              label: Text(
                genre,
                style: TextStyle(fontSize: 12),
              ),
            ),
          )
          .toList(),
    );
  }
}
