import 'package:AniFlix/components/loading_component/loading.dart';
import 'package:AniFlix/models/Anime.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'components/navigation/main_navigation_component.dart';

import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(AnimeAdapter());
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
      darkTheme: ThemeData(
        scaffoldBackgroundColor: kDarkModeScaffoldColor,
        primaryColor: kDarkModeScaffoldColor,
      ),
      theme: ThemeData(
        accentColor: Colors.blue[900],
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins',
      ),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: kScaffoldBackgroundColor,
          body: FutureBuilder(
            future: Hive.openBox('favorite_anime'),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.connectionState == ConnectionState.done) {
                if(snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return NavigationComponent();
                }
              } else {
                return Loading(
                  loadingMessage: 'Loading...',
                );
              }
            },
          ),
        ),
      ),
    );
  }
}


