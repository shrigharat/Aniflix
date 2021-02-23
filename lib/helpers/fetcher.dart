import 'dart:convert';
import 'dart:async';
import 'dart:core';

import 'package:AniFlix/models/Anime.dart';
import 'package:AniFlix/models/AnimeList.dart';
import 'package:AniFlix/models/episode.dart';
import 'package:http/http.dart' as http;

class Fetcher {
  static Future<Anime> animeFetcher(int id) async {
    var response = await http.get('https://api.jikan.moe/v3/anime/$id');
    if (response.statusCode == 200) {

      return Anime.fromJSON(jsonDecode(response.body));
    } else {
      print('An error occured while fetching the anime object!');
      return null;
    }
  }

  static Future<List<Anime>> topAnimeListFetcher(String url) async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return AnimeList.fromJSON(jsonDecode(response.body)['top'])
          .results
          .sublist(0, 12);
    } else {
      print('An error occured while fetching top anime list!');
      return <Anime>[];
    }
  }

  static Future<List<Episode>> animeEpisodesFetcher(int animeId) async {
    var response =
        await http.get('https://api.jikan.moe/v3/anime/$animeId/episodes');
    if (response.statusCode == 200) {
      return _convertMapToEpisodesList(jsonDecode(response.body)['episodes']);
    } else {
      print('An error occured while fetching anime episodes');
      return <Episode>[];
    }
  }

  static List<Episode> _convertMapToEpisodesList(
      List<dynamic> json) {
    List<Episode> episodeList = [];
    for (int i = 0; i < json.length; i++) {
      episodeList.add(Episode.fromJSON(json[i]));
    }
    return episodeList;
  }

  static Future<List<Anime>> animeRecommendationsFetcher({String url, String param} ) async {
    var response = await http
        .get(url);
    if (response.statusCode == 200) {
      try {
        return AnimeList.fromJSON(jsonDecode(response.body)[param])
          .results;
      } catch(e) {
        print('Exception was thrown while fetching recommendations!');
      }
    } else {
      print('An error occured while fetching top anime list!');
      return <Anime>[];
    }
  }

  static Future<String> animeImageStringFetcher(int animeId) async {
    var response = await http.get('https://api.jikan.moe/v3/anime/$animeId/pictures');
    if(response.statusCode==200) {
      return jsonDecode(response.body)['pictures'].last['large'];
    } else {
      print('Error fetching the anime high quality image url');
      return '';
    }
  }
}
