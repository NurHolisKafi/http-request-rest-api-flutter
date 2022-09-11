import 'package:flutter/material.dart';
import 'package:flutter_movie_api/service/http_service.dart';

import 'movie_detail.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  HttpService service = HttpService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Popular Movies"),
        ),
        body: FutureBuilder<List?>(
          future: service.getPopularMovies(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: EdgeInsets.all(5),
                child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: ((context, index) {
                    return Card(
                      color: Colors.white,
                      elevation: 2.0,
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      MovieDetail(snapshot.data![index])));
                        },
                        title: Text(
                            snapshot.data![index].title), //movies[index].title
                        subtitle: Text(
                            'Rating : ${snapshot.data![index].voteAverage}'), //'Rating : ${movies[index].voteAverage}'
                      ),
                    );
                  }),
                ),
              );
            } else {
              return Center(child: Text('Wait for a second.....'));
            }
          },
        ));
  }
}
