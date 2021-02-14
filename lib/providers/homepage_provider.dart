import 'package:AniFlix/models/Anime.dart';
import 'package:flutter/foundation.dart';

class HomePageProvider with ChangeNotifier {
  Map<String, List<Anime>> _animeList = {
    'popularList': [],
    'upComingList': [],
    'movieList': [],
  };


  List<Anime> getList(String listType) {
    switch(listType) {
      case 'bypopularity':
        return _animeList['popularList'];
      case 'upcoming':
        return _animeList['upComingList'];
      case 'movie':
        return _animeList['movieList'];
    }
  }

  void setList(List<Anime> myList, String listType) {
    switch(listType) {
      case 'bypopularity':
        _animeList['popularList'] = myList;
        break;
      case 'upcoming':
        _animeList['upComingList'] = myList;
        break;
      case 'movie':
        _animeList['movieList'] = myList;
        break;
    }
    print('$listType was set');
    notifyListeners();
  }

}