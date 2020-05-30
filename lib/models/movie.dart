class MovieModel {
  final int id;
  final String title;
  final String posterPath;
  final double voteAverage;
  final String releaseDate;
  final String originalLanguage;
  final List<dynamic> genreIds;

  MovieModel({
    this.id,
    this.title,
    this.posterPath,
    this.voteAverage,
    this.releaseDate,
    this.originalLanguage,
    this.genreIds,
  });

  factory MovieModel.fromJson(Map<String, dynamic> jsonMap) {
    return MovieModel(
      id: jsonMap['id'],
      title: jsonMap['title'],
      posterPath: jsonMap['poster_path'],
      voteAverage: jsonMap['vote_average'].toDouble(),
      releaseDate: jsonMap['release_date'],
      originalLanguage: jsonMap['original_language'],
      genreIds: jsonMap['genre_ids'],
    );
  }
}
