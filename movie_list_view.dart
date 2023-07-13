import 'package:flutter/material.dart';
import '../komponen/http_helper.dart'; //1

class MovieListView extends StatefulWidget { //2
  const MovieListView({Key? key}) : super(key: key);

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
//3
  late int moviesCount;
  late List movies;
  late HttpHelper helper;

  @override
  void initState() { //4
    defaultList();
    super.initState();
  }
  Future defaultList() async { //5
    moviesCount = 0;
    movies = [];
    helper = HttpHelper();
    List moviesFromAPI = [];
    moviesFromAPI = await helper.getUpComingAsList();
    setState(() {
      movies = moviesFromAPI;
      moviesCount = movies.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Daftar Film'),
    ),
    body: ListView.builder( //6
    itemCount: moviesCount,
    itemBuilder: (context, position) {
    return Card( //7
    elevation: 2,
    child: ListTile( //8
    title: Text(movies[position].title),
    subtitle: Text(
      'Released: ' +
          movies[position].releaseDate +
          ' - Vote: ' +
          movies[position].voteAverage.toString(),
    ),
    ),
    );
    },
    ),
    );
  }
}