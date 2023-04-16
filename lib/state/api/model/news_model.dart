import 'package:flutter/foundation.dart' show immutable;
import 'dart:collection' show MapView;

import 'package:qwique/state/new_firstore/models/news_key.dart';

class Article extends MapView<String, dynamic> {
  Article({
    required String title,
    required String description,
    required String author,
    required String content,
    required String publishedAt,
    required String urlToImage,
    required String articleUrl,
  }) : super({
          PostKey.title: title,
          PostKey.description: description,
          PostKey.author: author,
          PostKey.content: content,
          PostKey.publishedAt: publishedAt,
          PostKey.urlToImage: urlToImage,
          PostKey.url: articleUrl
        });
}
