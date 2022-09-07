class Movie {
  late int id;
  late String title;
  late String overview;
  late String posterPath;
  late double voteAverage;

  Movie(this.id, this.title, this.overview, this.posterPath, this.voteAverage);

  Movie.fromJason(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    title = parsedJson['title'];
    overview = parsedJson['overview'];
    posterPath = parsedJson['poster_path'];
    voteAverage = parsedJson['vote_average'] * 1.0;
  }
}
