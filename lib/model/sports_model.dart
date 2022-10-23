import 'dart:convert';

class SportModel {
  String? author;
  String? title;
  String? urlToImage;
  String? url;
  String? publishedAt;
  String? content;

  SportModel({
    required this.author,
    required this.title,
    required this.urlToImage,
    required this.url,
    required this.publishedAt,
    required this.content,
  });

  SportModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    author = json['author'];
    urlToImage = json['urlToImage'];
    url = json['url'];
    publishedAt = json['publishedAt'];
  }
}
