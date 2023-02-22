
import 'package:flutter/material.dart';
import 'package:movies_home_theater_app/Models/now_playing_response.dart';
import 'package:movies_home_theater_app/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate {

  @override
  String? get searchFieldLabel => 'Buscar Peliculas';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = ''
        , 
        icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back)
      );
  }

  @override
  Widget buildResults(BuildContext context) {
      return const Text('buildResults ==>');
  }

  Widget _emptySearchContainer() {
    return const Center(
        child: Icon(Icons.movie_creation_outlined, color: Colors.black38, size: 100,),
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if ( query.isEmpty) {
      return _emptySearchContainer();
    }

    final moviesProvider = Provider.of<MovieProvider>(context, listen: false);
    moviesProvider.getSuggestionByQueries( query );

    return StreamBuilder(
      stream: moviesProvider.suggestionStream,
      builder: ( _ , AsyncSnapshot<List<Movie>> snapshot) {
        if ( !snapshot.hasData ) {
          return _emptySearchContainer();
        }

        final List<Movie> movies = snapshot.data ?? []; 

        return ListView.builder(
          itemBuilder: ( _ , index) => _MovieItem( movies[index] ),
          itemCount: movies.length,
          );
      },
    );

  }

  @override
  Type get runtimeType => super.runtimeType;
}


class _MovieItem extends StatelessWidget {

  final Movie movie;
  const _MovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    movie.heroeId = 'search_${movie.id}';
    return ListTile(
      leading: Hero(
        tag: movie.heroeId ?? '',
        child: FadeInImage(
          placeholder: const AssetImage('assets/no-image.jpg'),
          image: NetworkImage( movie.fullPostImg ),
          width: 70,
          fit: BoxFit.contain,
        ),
      ),
      title: Text( movie.title ?? '' ),
      subtitle: Text( movie.originalTitle ?? '' ),
      onTap: () {
        Navigator.pushNamed(context, 'details', arguments: movie);
      },
    );
  }
}