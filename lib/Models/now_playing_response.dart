import 'dart:convert';

class NowPlayingResponse {
    NowPlayingResponse({
        this.dates,
        this.page,
        required this.results,
        this.totalPages,
        this.totalResults,
    });

    Dates? dates;
    int? page;
    List<Movie> results;
    int? totalPages;
    int? totalResults;

    factory NowPlayingResponse.fromRawJson(String str) => NowPlayingResponse.fromJson(json.decode(str));

    factory NowPlayingResponse.fromJson(Map<String, dynamic> json) => NowPlayingResponse(
        dates: Dates.fromJson(json["dates"]),
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );
}

class Dates {
    Dates({
        required this.maximum,
        required this.minimum,
    });

    String maximum;
    String minimum;

    factory Dates.fromRawJson(String str) => Dates.fromJson(json.decode(str));

    factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: json["maximum"],
        minimum: json["minimum"],
    );
}

class Movie {
    Movie({
        this.posterPath,
        this.adult,
        this.overview,
        this.releaseDate,
        required this.genreIds,
        this.id,
        this.originalTitle,
        this.originalLanguage,
        this.title,
        this.backdropPath,
        this.popularity,
        this.voteCount,
        this.video,
        this.voteAverage,
        this.heroeId
    });

    String? posterPath;
    bool? adult;
    String? overview;
    String? releaseDate;
    List<int> genreIds;
    int? id;
    String? originalTitle;
    OriginalLanguage? originalLanguage;
    String? title;
    String? backdropPath;
    double? popularity;
    int? voteCount;
    bool? video;
    double? voteAverage;
    String? heroeId;

    get fullPostImg {
      if (posterPath != null ) {
        return 'https://image.tmdb.org/t/p/w500$posterPath';
      }
      return 'https://i.stack.imgur.com/GNhxO.png';
    }

    get fullBackLog {
      if (backdropPath != null ) {
        return 'https://image.tmdb.org/t/p/w500$backdropPath';
      }
      return 'https://i.stack.imgur.com/GNhxO.png';
    }

    factory Movie.fromRawJson(String str) => Movie.fromJson(json.decode(str));

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        posterPath: json["poster_path"],
        adult: json["adult"],
        overview: json["overview"],
        releaseDate: json["release_date"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalTitle: json["original_title"],
        originalLanguage: originalLanguageValues.map[json["original_language"]],
        title: json["title"],
        backdropPath: json["backdrop_path"],
        popularity: json["popularity"].toDouble(),
        voteCount: json["vote_count"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
    );
}

enum OriginalLanguage { EN, SV }

final originalLanguageValues = EnumValues({
    "en": OriginalLanguage.EN,
    "sv": OriginalLanguage.SV
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
