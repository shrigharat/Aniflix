import 'package:flutter/material.dart';

import 'package:AniFlix/constants.dart';

class AnimeDetailImage extends StatelessWidget {
  final String imgUrl;
  final String title;
  final addToFavorites;

  AnimeDetailImage({this.imgUrl, this.title, this.addToFavorites});

  @override
  Widget build(BuildContext context) {
    ImageProvider myImage =
        imgUrl == '' ? AssetImage('') : NetworkImage(imgUrl);
    return Container(
      height: 370,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: myImage,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  iconSize: 19,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: kMyBlueColor,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 11,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          height: 1.05,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () => addToFavorites(),
                      child: Icon(
                        Icons.favorite_outline,
                        color: kMyBlueColor,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
