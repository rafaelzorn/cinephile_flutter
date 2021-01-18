class MoviesModel {
  final int id;
  final String title;
  final String posterPath;
  final dynamic voteAverage;
  final String releaseDate;
  final String originalLanguage;
  final List<dynamic> genreIds;

  MoviesModel({
    this.id,
    this.title,
    this.posterPath,
    this.voteAverage,
    this.releaseDate,
    this.originalLanguage,
    this.genreIds,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> jsonMap) {
    return MoviesModel(
      id: jsonMap['id'],
      title: jsonMap['title'],
      posterPath: jsonMap['poster_path'],
      voteAverage: jsonMap['vote_average'],
      releaseDate: jsonMap['release_date'],
      originalLanguage: jsonMap['original_language'],
      genreIds: jsonMap['genre_ids'],
    );
  }
}
