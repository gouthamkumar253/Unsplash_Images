import 'dart:convert';
import 'package:unsplash_api/models/all_images.dart';
import 'package:http/http.dart' as http;
import 'package:unsplash_api/models/search_images.dart';

class ImagesAPI {
  final Map<String, String> _headers = <String, String>{
    'Authorization':
        'Client-ID c5a89147f355d05474b82dbf6671950f51a637456175d804f17c770531a50183'
  };

  Future<List<AllImages>> recentImages({int page = 1, int value = 1}) async {
    print('Control is in recentImages');
    String url;
    switch (value) {
      case 1:
        {
          url =
              'https://api.unsplash.com/photos?page=$page&per_page=20&order_by=popular';
          break;
        }
      case 2:
        {
          url =
              'https://api.unsplash.com/photos?page=$page&per_page=20&order_by=latest';
          break;
        }
      case 3:
        {
          url =
              'https://api.unsplash.com/photos?page=$page&per_page=20&order_by=oldest';
          break;
        }
    }
    final http.Response response = await http.get(url, headers: _headers);
    if (response.statusCode == 200) {
      print('status code obtained');
      print(response.body);
      final List<dynamic> jsonResult = json.decode(response.body);
      final List<AllImages> photos = <AllImages>[];
      for (dynamic json in jsonResult) {
        final AllImages image = AllImages.fromJson(json);
        photos.add(image);
      }
      return photos;
    } else {
      print(response.body);
      throw Exception('Failed to load post');
    }
  }

  Future<SearchResults> searchImageResults(String query) async {
    final String url =
        'https://api.unsplash.com/search/photos?page=1&per_page=30&query=$query';
    final http.Response response = await http.get(url, headers: _headers);
    if (response.statusCode == 200) {
      print('status code obtained for query');
      print(response.body);
      final dynamic jsonResult = json.decode(response.body);
      final SearchResults results = SearchResults.fromJson(jsonResult);
      return results;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
