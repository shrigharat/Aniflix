import 'package:flutter/material.dart';

import 'package:AniFlix/models/episode.dart';

class AnimeEpisodesComponent extends StatelessWidget {
  final List<Episode> episodeList;

  AnimeEpisodesComponent({this.episodeList});

  @override
  Widget build(BuildContext context) {
    print('Tab 2 view build called');
    return ListView.builder(
      itemCount: episodeList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.fromLTRB(8, 12, 8, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.blue[900],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Episode ${episodeList[index].episodeId}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white)),
              Text(
                episodeList[index].episodeTitle,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              Text(
                episodeList[index].isEpisodeFiller ? 'Canon' : 'Filler',
                style: TextStyle(color: Colors.grey[400], fontSize: 12),
              ),
            ],
          ),
        );
      },
    );
  }
}
