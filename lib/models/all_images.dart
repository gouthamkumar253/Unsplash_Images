// To parse this JSON data, do
//
//     final allImages = allImagesFromJson(jsonString);

import 'dart:convert';

import 'package:unsplash_api/models/image_url.dart';
import 'package:unsplash_api/models/user_details.dart';

class AllImages {
  AllImages({
    this.id,
    this.createdAt,
    this.width,
    this.height,
    this.color,
    this.description,
    this.user,
    this.urls,
  });

  factory AllImages.fromRawJson(String str) =>
      AllImages.fromJson(json.decode(str));

  factory AllImages.fromJson(Map<String, dynamic> json) => AllImages(
        id: json['id'],
        createdAt: DateTime.parse(json['created_at']),
        width: json['width'],
        height: json['height'],
        color: json['color'],
        description: json['description'],
        user: User.fromJson(json['user']),
        urls: Urls.fromJson(json['urls']),
      );

  String id;
  DateTime createdAt;
  int width;
  int height;
  String color;
  String description;
  User user;
  Urls urls;
}
