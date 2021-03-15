import 'package:AniFlix/models/Anime.dart';

class HomePageState {
  List<Anime> popularList = [];
  List<Anime> upcomingList = [];
  List<Anime> movieList = [];

  HomePageState._();

  factory HomePageState.initial() {
    return HomePageState._()
      ..popularList = <Anime>[]
      ..movieList = <Anime>[]
      ..upcomingList = <Anime>[];
  }
}
