import 'package:flutter/foundation.dart';

abstract class HomePageEvent {}

class FetchAnimeListEvent extends HomePageEvent {
  final String listType;

  FetchAnimeListEvent({@required this.listType});
}