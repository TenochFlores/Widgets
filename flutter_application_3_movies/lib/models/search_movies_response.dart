// To parse this JSON data, do
//
//     final searchResponse = searchResponseFromMap(jsonString);

import 'dart:convert';

import 'package:flutter_application_3_movies/models/models.dart';

class SearchResponse {
    SearchResponse({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    factory SearchResponse.fromJson(String str) => SearchResponse.fromMap(json.decode(str));

    factory SearchResponse.fromMap(Map<String, dynamic> json) => SearchResponse( 
        page: json["page"] == null ? 1 : json["page"],
        results: List<Movie>.from(json["results"] == null ? [] : json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"] == null ? 1 : json["total_pages"],
        totalResults: json["total_results"] == null ? 1 : json["total_results"],
    );
}
