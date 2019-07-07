// To parse this JSON data, do
//
//     final searchResults = searchResultsFromJson(jsonString);

import 'dart:convert';

import 'package:unsplash_api/models/all_images.dart';

SearchResults searchResultsFromJson(String str) =>
    SearchResults.fromJson(json.decode(str));

class SearchResults {
  SearchResults({
    this.total,
    this.totalPages,
    this.results,
  });

  factory SearchResults.fromJson(Map<String, dynamic> json) => SearchResults(
        total: json['total'],
        totalPages: json['total_pages'],
        results: List<AllImages>.from(
            json['results'].map((dynamic x) => AllImages.fromJson(x))),
      );

  int total;
  int totalPages;
  List<AllImages> results;
}
