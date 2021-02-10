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

  final List<List<String>> images = [
    [
      'https://cdn.mainichi.jp/vol1/2020/10/28/20201028p2a00m0et023000p/8.jpg?2',
      'Kimetsu no yaiba'
    ],
    [
      'https://images-na.ssl-images-amazon.com/images/I/61gW30tH4eL._AC_SL1001_.jpg',
      'Naruto'
    ],
    [
      'https://ae01.alicdn.com/kf/H88fc9c5ccaa44ae49435bfc82d84e4bbv/Soma-Food-Wars-Anime-Manga-Large-Fan-Silk-Poster-Wall-Sticker-Decoration-Gift.jpg',
      'Food wars'
    ],
    [
      'https://media.comicbook.com/2019/03/black-clove-chapter-198-cover-1163653-1280x0.jpeg',
      'Black clover sore wa mondai dake do ore wa tsuyoi des kara gaman dekiru Mahou te ni nareru'
    ],
    [
      'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=727&q=80',
      'Fate stay/night UBW'
    ],
    [
      'https://images.unsplash.com/photo-1556732282-595ef530909c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
      'Haikyuu'
    ],
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      Duration(seconds: 5),
      (Timer timer) {
        if (_currentIndex < images.length - 1) {
          _currentIndex++;
        } else {
          _currentIndex = 0;
        }

        _pageController.animateToPage(
          _currentIndex,
          duration: Duration(milliseconds: 300),
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
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 250,
      child: PageView.builder(
        controller: _pageController,
        itemCount: images.length,
        onPageChanged: _onPageChanged,
        itemBuilder: (BuildContext context, int index) {
          return CarouselItem(
            item: images[index],
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
