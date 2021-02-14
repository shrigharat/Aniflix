import 'dart:convert';

import 'package:AniFlix/models/Anime.dart';
import 'package:AniFlix/models/AnimeList.dart';
import 'package:http/http.dart' as http;

class Fetcher {
  static Future<Anime> animeFetcher(int id) async {
    var response = await http.get('https://api.jikan.moe/v3/anime/$id');
    if(response.statusCode==200) {
      return Anime.fromJSON(jsonDecode(response.body));
    } else {
      return Anime();
    }
  }

  static Future<List<Anime>> topAnimeListFetcher(String url) async {
    var response = await http.get(url);
    if(response.statusCode == 200) {
      return AnimeList.fromJSON(jsonDecode(response.body)['top']).results;
    } else {
      print('An error occured while fetching data!');
      return <Anime>[];
    }
  }

}