import 'dart:convert';

class Urls {
  Urls({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb,
  });

  factory Urls.fromRawJson(String str) => Urls.fromJson(json.decode(str));


  factory Urls.fromJson(Map<String, dynamic> json) =>  Urls(
    raw: json['raw'],
    full: json['full'],
    regular: json['regular'],
    small: json['small'],
    thumb: json['thumb'],
  );

  String raw;
  String full;
  String regular;
  String small;
  String thumb;



}
