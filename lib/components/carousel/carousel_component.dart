import 'package:AniFlix/components/carousel/carousel_data.dart';
import 'package:AniFlix/models/Anime.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'carousel_indicator_component.dart';
import 'carousel_item_component.dart';


class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final PageController _pageController = PageController(initialPage: 0);

  int _currentIndex = 0;

  Timer _timer;

  final images = CarouselItems;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      Duration(seconds: 5),
      (Timer timer) {
        if (_currentIndex < images.length - 1) {
          _currentIndex++;
        } else {
          _currentIndex = 0;
        }

        _pageController.animateToPage(
          _currentIndex,
          duration: Duration(milliseconds: 700),
          curve: Curves.easeIn,
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
    _timer.cancel();
  }

  void _onPageChanged(int index) {
    if(this.mounted) {
      setState(() {
        _currentIndex = index;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: PageView.builder(
        controller: _pageController,
        itemCount: images.length,
        onPageChanged: _onPageChanged,
        itemBuilder: (BuildContext context, int index) {
          return CarouselItem(
            item: Anime.fromJSON(images[index]),
            carouselIndicator: CarouselIndicator(
              itemCount: images.length,
              currentIndex: _currentIndex,
            ),
          );
        },
      ),
    );
  }
}
