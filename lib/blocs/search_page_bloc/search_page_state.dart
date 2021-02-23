import 'package:AniFlix/models/Anime.dart';

class SearchPageState {

  List<Anime> animeList;

  SearchPageState._();

  factory SearchPageState.initial() {
    return SearchPageState._()..animeList = [];
  }

}