import 'package:flutter/foundation.dart';

abstract class SearchPageEvent {}

class FetchGenreAnimeEvent extends SearchPageEvent {
  int genreId;

  FetchGenreAnimeEvent({@required this.genreId}) ;

}

class FetchSearchedAnimeEvent extends SearchPageEvent {
  String animeName;

  FetchSearchedAnimeEvent({@required this.animeName}) ;
}