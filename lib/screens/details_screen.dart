import 'package:flutter/material.dart';
import 'package:movies_home_theater_app/Models/now_playing_response.dart';
import 'package:movies_home_theater_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final Movie movie = ModalRoute.of(context)?.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movie: movie,),
          _SliverCustomListContainer(movie: movie,)
        ],
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;
  const _CustomAppBar({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: const EdgeInsets.only( bottom: 10, left: 10, right: 10),
          child: Text(movie.title ?? '', textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'), 
          image: NetworkImage(movie.fullBackLog),
          fit: BoxFit.cover,
          ),
      ),
    );
  }
}

class _SliverCustomListContainer extends StatelessWidget {

  final Movie movie;
  const _SliverCustomListContainer({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        _PosterAndTitle(movie: movie,),
        _Overview(movie: movie,),
        CastingCards(movieId: movie.id ?? -1,)
      ])
      );
  }
}


class _PosterAndTitle extends StatelessWidget {

  final Movie movie;
  const _PosterAndTitle({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    
    return Container(
      margin: const EdgeInsets.only( top: 20 ),
      padding: const EdgeInsets.symmetric( horizontal: 20),
      child: Row(
        children: [

          Hero(
            tag: movie.heroeId ?? '',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/loading.gif'),
                image: NetworkImage(movie.fullPostImg),
                height: 150,
                ),
            ),
          ),

        const SizedBox( width: 20),

        ConstrainedBox(
          constraints: BoxConstraints( maxWidth: size.width - 190),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
              Text(movie.title ?? '', 
                  style: textTheme.headlineSmall,
                  overflow: TextOverflow.ellipsis, 
                  maxLines: 2),
        
              Text(movie.originalTitle ?? '', 
                style: textTheme.titleMedium, 
                overflow: TextOverflow.ellipsis,
                maxLines: 2),
        
              Row(
                children: [
                  const Icon( Icons.star_outline, size: 15, color: Colors.grey ),
                  const SizedBox( width: 8),
                  Text('${movie.voteAverage}', style: textTheme.bodySmall),
                ],
              )
            ],
          ),
        )

        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {

  final Movie movie;
  const _Overview({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
      child: Text(movie.overview ?? '',
      textAlign: TextAlign.justify,
      style: textTheme.titleMedium,
      ),
    );
  }
}