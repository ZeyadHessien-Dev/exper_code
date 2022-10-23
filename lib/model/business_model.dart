import 'dart:convert';

class BusinessModel {
  String? author;
  String? title;
  String? urlToImage;
  String? url;
  String? publishedAt;
  String? content;

  BusinessModel({
    required this.author,
    required this.title,
    required this.urlToImage,
    required this.url,
    required this.publishedAt,
    required this.content,
  });

  BusinessModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    author = json['author'];
    urlToImage = json['urlToImage'];
    url = json['url'];
    publishedAt = json['publishedAt'];
  }
}
