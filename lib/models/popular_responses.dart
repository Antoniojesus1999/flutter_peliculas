// To parse this JSON data, do
//
//     final popularResponses = popularResponsesFromMap(jsonString);

import 'dart:convert';

import 'package:peliculas/models/models.dart';

class PopularResponses {
  PopularResponses({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory PopularResponses.fromJson(String str) =>
      PopularResponses.fromMap(json.decode(str));

  factory PopularResponses.fromMap(Map<String, dynamic> json) =>
      PopularResponses(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
