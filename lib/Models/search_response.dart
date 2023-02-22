import 'dart:convert';
import 'package:movies_home_theater_app/Models/now_playing_response.dart';

class SearchResponse {
    SearchResponse({
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });

    int? page;
    List<Movie>? results;
    int? totalPages;
    int? totalResults;

    factory SearchResponse.fromRawJson(String str) => SearchResponse.fromJson(json.decode(str));

    factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        page: json["page"],
        results: json["results"] == null ? [] : List<Movie>.from(json["results"]!.map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );
}