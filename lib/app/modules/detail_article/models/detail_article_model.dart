// To parse this JSON data, do
//
//     final detailArticlesModel = detailArticlesModelFromJson(jsonString);

import 'dart:convert';

Detailnews detailArticlesModelFromJson(String str) => Detailnews.fromJson(json.decode(str));

String detailArticlesModelToJson(Detailnews data) => json.encode(data.toJson());

class Detailnews {
  Detailnews({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;

  factory Detailnews.fromJson(Map<String, dynamic> json) => Detailnews(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
