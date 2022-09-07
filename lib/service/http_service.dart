import 'dart:convert';

import 'package:flutter_movie_api/models/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class HttpService {
  final String apiKey = 'a3672ef32d59083ca60853116e4ffa00';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<List?> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));

    if (result.statusCode == HttpStatus.ok) {
      print('sukses');
      final jsonResponse = jsonDecode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJason(i)).toList();
      return movies;
    } else {
      print('false');
      return null;
    }
  }
}
