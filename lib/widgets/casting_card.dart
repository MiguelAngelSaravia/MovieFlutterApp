import 'package:flutter/material.dart';
import 'package:movies_home_theater_app/Models/credits_response.dart';
import 'package:movies_home_theater_app/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {

  final int movieId;

  const CastingCards({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {

    final movieProvider = Provider.of<MovieProvider>(context, listen: false);

    return FutureBuilder(
      future: movieProvider.fetchCredits(movieId),
      builder: ( _ , AsyncSnapshot<List<Cast>> snapshot) {

        if (!snapshot.hasData) {
          return const SizedBox(
            height: 180,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        final List<Cast> list = snapshot.data ?? [];

        return Container(
          margin: const EdgeInsets.only( bottom: 30 ),
          width: double.infinity,
          height: 180,
          child: ListView.builder(
            itemCount: list.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: ( _ , index) => _CastCard(cast: list[index])
            ),
        );

      },
    );
  }
}

class _CastCard extends StatelessWidget {
  final Cast cast;

  const _CastCard({required this.cast});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric( horizontal: 10),
      width: 110,
      height: 100,
      child: Column(children: [

        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            placeholder: const AssetImage('assets/no-image.jpg'), 
            image: NetworkImage(cast.fullProfilePath),
            height: 140,
            width: 100,
            fit: BoxFit.cover,
            ),
        ),

        const SizedBox( height: 5 ),

        Text(cast.name ?? '',
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        maxLines: 2,
        ),
      ]),
    );
  }
}