import 'package:flutter/material.dart';
import 'package:flutter_movie_api/service/http_service.dart';

import 'movie_detail.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List? movies;
  HttpService? service;
  int? count;

  Future initialize() async {
    movies = [];
    movies = await service!.getPopularMovies();
    count = movies!.length;
    setState(() {
      count = movies!.length;
      movies = movies;
      print(count);
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Popular Movies"),
        ),
        body: ListView.builder(
          itemCount: count,
          itemBuilder: ((context, index) {
            return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => MovieDetail(movies?[index])));
                },
                title: Text(movies?[index].title), //movies[index].title
                subtitle: Text(
                    'Rating : ${movies?[index].voteAverage}'), //'Rating : ${movies[index].voteAverage}'
              ),
            );
          }),
        ));
  }
}
