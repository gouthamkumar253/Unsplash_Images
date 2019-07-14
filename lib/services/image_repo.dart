import 'dart:async';
import 'package:unsplash_api/data/images_api.dart';
import 'package:unsplash_api/models/all_images.dart';
import 'package:unsplash_api/models/search_images.dart';


class Repository {

  final ImagesAPI moviesApiProvider = ImagesAPI();


  Future<List<AllImages>> fetchAllImages(int page,int value) => moviesApiProvider.recentImages(page:page,value:value);
  Future<SearchResults> searchQueryImages(String searchQuery) => moviesApiProvider.searchImageResults(searchQuery);


}