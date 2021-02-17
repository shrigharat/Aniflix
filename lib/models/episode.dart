class Episode {
  final int episodeId;
  final String episodeTitle;
  final bool isEpisodeFiller;

  Episode({this.episodeId, this.episodeTitle, this.isEpisodeFiller});

  factory Episode.fromJSON(Map<String, dynamic> json) {
    return Episode(
      episodeId: json['episode_id'],
      episodeTitle: json['title'],
      isEpisodeFiller: json['filler'],
    );
  }
}