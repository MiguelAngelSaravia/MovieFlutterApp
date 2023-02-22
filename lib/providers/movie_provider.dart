import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_home_theater_app/Models/credits_response.dart';
import 'package:movies_home_theater_app/Models/now_playing_response.dart';
import 'package:movies_home_theater_app/Models/populate_response.dart';
import 'package:movies_home_theater_app/Models/search_response.dart';
import 'package:movies_home_theater_app/helpers/debouncer.dart';

class MovieProvider extends ChangeNotifier {

  final String _apiKey = '781a9184d6aa51b3bfdfeef535233cd8';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  List<Movie> searchMovies = [];
  Map<int, List<Cast>> movieCast = {};
  int _popularPages = 0;

  final Debouncer debouncer = Debouncer(
    duration: const Duration( milliseconds: 500 ),
  );

  final StreamController<List<Movie>> _suggestionStreamController = StreamController.broadcast();
  Stream<List<Movie>> get suggestionStream => this._suggestionStreamController.stream;



   MovieProvider() {
    fetchMovies();
    fetchPopulates();
   }

   Future<String> _getJsonData(String endPoint, [int pages = 1, String query = '']) async {
      Map<String, dynamic> params = {
       'api_key': _apiKey,
       'language': _language,
       'page': '$pages'
       };

    if ( query.isNotEmpty ) {
      params['query'] = query;
    }

     var url = Uri.https(_baseUrl, endPoint, params);
     final response = await http.get(url);
     return response.body;
   }

   fetchMovies() async {
     final jsonData = await _getJsonData('3/movie/now_playing');
     final nowPLayingResponse = NowPlayingResponse.fromRawJson(jsonData);
     onDisplayMovies = nowPLayingResponse.results;
     notifyListeners();
   }

   fetchPopulates() async {
     _popularPages++;
     final jsonData = await _getJsonData('3/movie/popular', _popularPages);
     final popularResponse = PopulateResponse.fromRawJson(jsonData);
     popularMovies = [ ...popularMovies , ...popularResponse.results];
     notifyListeners();
   }

  Future<List<Cast>> fetchCredits(int movieId) async {

    if ( movieCast.containsKey(movieId) ) return movieCast[movieId] ?? [];

    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromRawJson(jsonData);
    movieCast[movieId] = creditsResponse.cast ?? [];
    return creditsResponse.cast ?? [];
   }

   Future<List<Movie>> fetchSearchMovie(String query) async {
    final jsonData = await _getJsonData('3/search/movie', 1, query);
    final searchResponse = SearchResponse.fromRawJson(jsonData);
    searchMovies = searchResponse.results ?? [];
    return searchMovies;
   }

   void getSuggestionByQueries( String searchTerm) {
     debouncer.value = '';
     debouncer.onValue = ( value ) async {
       final results = await fetchSearchMovie( searchTerm );
       _suggestionStreamController.add(results);
     };
     final timer = Timer.periodic(const Duration( milliseconds: 300 ), ( _ ) { 
       debouncer.value = searchTerm;
     });

     Future.delayed(const Duration( milliseconds: 301 )).then(( _ ) => timer.cancel());
   }
}