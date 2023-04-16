import 'dart:collection' show MapView;

import 'package:cloud_firestore/cloud_firestore.dart' show FieldValue;
import 'package:flutter/foundation.dart' show immutable;
import 'package:qwique/state/new_firstore/models/news_key.dart';

@immutable
class PostPayload extends MapView<String, dynamic> {
  PostPayload({
    required String newsId,
    required String name,
    required String author,
    required String title,
    required String description,
    required double url,
    required String urlToImage,
    required String publishedAt,
    required String content,
  }) : super(
          {
            PostKey.newsId: newsId,
            PostKey.name: name,
            PostKey.author: author,
            PostKey.title: title,
            PostKey.description: description,
            PostKey.url: url,
            PostKey.urlToImage: urlToImage,
            PostKey.publishedAt: publishedAt,
            PostKey.content: content,
          },
        );
}
