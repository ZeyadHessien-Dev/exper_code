import 'dart:convert';

class ScienceModel {
  String? author;
  String? title;
  String? urlToImage;
  String? url;
  String? publishedAt;
  String? content;

  ScienceModel({
    required this.author,
    required this.title,
    required this.urlToImage,
    required this.url,
    required this.publishedAt,
    required this.content,
  });

  ScienceModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    author = json['author'];
    urlToImage = json['urlToImage'];
    url = json['url'];
    publishedAt = json['publishedAt'];
  }
}
