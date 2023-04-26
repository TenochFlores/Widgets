// To parse this JSON data, do
//
//     final topRated = topRatedFromMap(jsonString);

import 'dart:convert';

import 'package:flutter_application_3_movies/models/movie.dart';

class TopRatedResponse {
    TopRatedResponse({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    factory TopRatedResponse.fromJson(String str) => TopRatedResponse.fromMap(json.decode(str));

    factory TopRatedResponse.fromMap(Map<String, dynamic> json) => TopRatedResponse(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );
}

