// To parse this JSON data, do
//
//     final populateResponse = populateResponseFromJson(jsonString);

import 'dart:convert';

import 'package:movies_home_theater_app/Models/now_playing_response.dart';

class PopulateResponse {
    PopulateResponse({
        this.page,
        required this.results,
        this.totalPages,
        this.totalResults,
    });

    int? page;
    List<Movie> results;
    int? totalPages;
    int? totalResults;

    factory PopulateResponse.fromRawJson(String str) => PopulateResponse.fromJson(json.decode(str));

    factory PopulateResponse.fromJson(Map<String, dynamic> json) => PopulateResponse(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );
}