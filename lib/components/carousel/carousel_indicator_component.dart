import 'package:flutter/material.dart';

class CarouselIndicator extends StatelessWidget {
  final int currentIndex;
  final int itemCount;

  CarouselIndicator({this.currentIndex, this.itemCount});

  Widget indicator(bool isActive) {
    return Expanded(
      child: Container(
        height: isActive ? 8 : 4,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      ),
    );
  }

  List<Widget> _buildIndicator(int currentIndex) {
    List<Widget> indicators = [];
    for (int i = 0; i < itemCount; i++) {
      indicators.add(indicator(currentIndex == i));
    }
    return indicators;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      margin: EdgeInsets.only(
        bottom: 5,
//        left: 5,
      ),
      child: Row(
        children: _buildIndicator(currentIndex),
      ),
    );
  }
}
