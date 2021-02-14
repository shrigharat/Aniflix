import 'package:AniFlix/pages/home/anime_detail_page.dart';
import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('MyApp was rebuild!!!');
    return MaterialApp(
      title: 'AniFlix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins',
      ),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: AnimeDetailPage(),
        ),
      ),
    );
  }
}


