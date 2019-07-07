import 'dart:convert';
class User {
  User({
    this.id,
    this.username,
    this.name,
    this.location,
    this.instagramUsername,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));


  factory User.fromJson(Map<String, dynamic> json) =>  User(
    id: json['id'],
    username: json['username'],
    name: json['name'],
    location: json['location'],
    instagramUsername: json['instagram_username'],
  );

  String id;
  String username;
  String name;
  String location;
  String instagramUsername;



}
