import 'package:flutter/material.dart';

import 'package:AniFlix/constants.dart';

class MyBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final onTap;

  MyBottomNavBar({@required this.selectedIndex, @required this.onTap});

  List<Widget> buildIcons() {
    List<IconData> icons = [
      Icons.home_outlined,
      Icons.search_outlined,
      Icons.favorite_border,
      Icons.person_outlined
    ];

    List<NavBarItem> navBarItems = [];
    
    for (int i = 0; i < icons.length; i++) {
      navBarItems.add(NavBarItem(
        id: i,
        onTap: onTap,
        size: selectedIndex == i ? 42 : 24,
        color: selectedIndex == i ? Colors.white : Colors.grey.shade400,
        icon: Icon(icons[i]),
      ));
    }
    return navBarItems;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: double.infinity,
      height: 60.0,
      decoration: BoxDecoration(
        color: kMyBlueColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: buildIcons(),
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final int id;
  final onTap;
  final Icon icon;
  final double size;
  final Color color;

  const NavBarItem(
      {Key key,
      @required this.id,
      @required this.color,
      @required this.onTap,
      @required this.icon,
      @required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: null,
      icon: icon,
      iconSize: size,
      onPressed: () => onTap(id),
      color: color,
    );
  }
}
