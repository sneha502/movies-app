import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:tmdb_movie/widgets/toprated.dart';
import 'package:tmdb_movie/widgets/trending.dart';
import 'package:tmdb_movie/widgets/tv.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];

  final String apikey = '3d533fad3a7f82fcd9c3255e5a3f480f';
  final String readaccesstoken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzZDUzM2ZhZDNhN2Y4MmZjZDljMzI1NWU1YTNmNDgwZiIsInN1YiI6IjY2NWRhZDVlNWJmYmExZjFkMTkwNzBhYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.y66ykmg1J0utC_eN8_G-DbDqnNYJtircwGIkBOmxNZo';

  @override
  void initState(){
    loadmovies();
    super.initState();
  }

  loadmovies() async
  {
    TMDB tmdb = TMDB(ApiKeys(apikey, readaccesstoken),
    logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true,
    ),
    );
    Map trendingresult = await tmdb.v3.trending.getTrending();
    Map topratedresult = await tmdb.v3.movies.getTopRated();
    Map tvresult = await tmdb.v3.tv.getPopular();

    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult ['results'];
      tv = tvresult['results'];
    });
    print(trendingmovies);
    print(tv);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Flutter Movie App ❤️'
        ),
      ),
      body: ListView(
        children: [
          TV(tv: tv),
          TrendingMovies(trendingmo: trendingmovies),
          TopRated(toprated: topratedmovies),
        ],
      ),
    );
  }
}
