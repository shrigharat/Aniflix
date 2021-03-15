import 'package:flutter/material.dart';

import 'package:AniFlix/pages/home_page.dart';
import 'package:AniFlix/pages/search_page.dart';
import 'package:AniFlix/pages/favorites_page.dart';
import 'package:AniFlix/pages/user_settings.dart';

import 'package:AniFlix/components/navigation/my_bottomnav_component.dart';

class NavigationComponent extends StatefulWidget {
  @override
  _NavigationComponentState createState() => _NavigationComponentState();
}

class _NavigationComponentState extends State<NavigationComponent> {
  int _selectedIndex = 0;

  List<Widget> containers = [
    HomePage(),
    SearchPage(),
    FavoritesPage(),
    UserSettingsPage()
  ];

  void changeIndex(int newIndex) {
    setState(() {
      _selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          containers[_selectedIndex],
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.transparent,
                      Colors.white,
                    ])),
                child: MyBottomNavBar(
                  selectedIndex: _selectedIndex,
                  onTap: changeIndex,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
