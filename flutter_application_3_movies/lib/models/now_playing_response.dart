// To parse this JSON data, do
//
//     final nowPlayingResponse = nowPlayingResponseFromMap(jsonString);

import 'dart:convert';

import 'package:flutter_application_3_movies/models/models.dart';



class NowPlayingResponse {
    NowPlayingResponse({
        required this.dates,
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    Dates dates;
    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    factory NowPlayingResponse.fromJson(String str) => NowPlayingResponse.fromMap(json.decode(str));

    factory NowPlayingResponse.fromMap(Map<String, dynamic> json) => NowPlayingResponse(
        dates        : Dates.fromMap(json["dates"]),
        page         : json["page"],
        results      : List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages   : json["total_pages"],
        totalResults : json["total_results"],
    );

    // Map<String, dynamic> toMap() => {
    //     "dates": dates.toMap(),
    //     "page": page,                                                    //Se usa para mandar una peticion HTTP
    //     "results": List<dynamic>.from(results.map((x) => x.toMap())),    //En este caso no se va a usar
    //     "total_pages": totalPages,
    //     "total_results": totalResults,
    // };
}
