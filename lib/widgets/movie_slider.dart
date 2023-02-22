
import 'package:flutter/material.dart';
import 'package:movies_home_theater_app/Models/now_playing_response.dart';

class MovieSlider extends StatefulWidget {

  final List<Movie> movies;
  final String? title;
  final Function onNextPage;

  const MovieSlider({
    super.key, 
    required this.movies, this.title, required this.onNextPage
  });

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500) {
        widget.onNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null) 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(widget.title ?? '', style: const TextStyle( fontSize: 20, fontWeight: FontWeight.bold),)
              ),

          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: ( _ , index) {
                return _MoviePoster(widget.movies[index], widget.title);
              },
              ),
            ),

        ]
        ),
    );
  }
}


class _MoviePoster extends StatelessWidget {
  final Movie populate;
  final String? title;
  const _MoviePoster(this.populate, this.title);

  @override
  Widget build(BuildContext context) {
    String underScore = '_';
    populate.heroeId = '$title$underScore${populate.id}';

    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric( horizontal: 10),
      child: Column(
        children: [

          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: populate),
            child: Hero(
              tag: populate.heroeId ?? '',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'), 
                  image: NetworkImage(populate.fullPostImg),
                  width: 130,
                  height: 160,
                  fit: BoxFit.cover,
                  ),
              ),
            ),
          ),

          const SizedBox( height: 5),
          
          Text( populate.title ?? '', 
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          maxLines: 2,
          ),
        ],
      ),
    );
  }
}