import 'package:AniFlix/components/carousel/carousel_indicator_component.dart';
import 'package:flutter/material.dart';

class CarouselItem extends StatelessWidget {
  final List<String> item;
  final CarouselIndicator carouselIndicator;

  CarouselItem({this.item, this.carouselIndicator});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            item[0],
          ),
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
                  item[1],
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
    );
  }
}
