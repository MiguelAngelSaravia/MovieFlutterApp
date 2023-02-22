import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:movies_home_theater_app/search/search_delegate.dart';
import 'package:movies_home_theater_app/providers/movie_provider.dart';
import 'package:movies_home_theater_app/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final movieProvider = Provider.of<MovieProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()), 
            icon: const Icon( Icons.search_outlined)
            )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiper(movies: movieProvider.onDisplayMovies),
            MovieSlider(movies: movieProvider.popularMovies, title: 'Popular' , onNextPage: () => movieProvider.fetchPopulates()),
            //  MovieSlider(populates: movieProvider.popularMovies,),
            //  MovieSlider(populates: movieProvider.popularMovies,),
            //  MovieSlider(populates: movieProvider.popularMovies,),

          ],
        ),
      )
    );
  }
}