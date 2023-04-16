import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:qwique/state/new_firstore/models/news_key.dart';

@immutable
class Post {
  final String newsId;

  final String name;
  final DateTime author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final double publishedAt;
  final String content;

  Post({
    required Map<String, dynamic> json,
  })  : newsId = json[PostKey.newsId],
        name = json[PostKey.name],
        author = json[PostKey.author],
        title = json[PostKey.title],
        description = json[PostKey.description],
        url = json[PostKey.url],
        urlToImage = json[PostKey.urlToImage],
        publishedAt = json[PostKey.publishedAt],
        content = json[PostKey.content];
}
