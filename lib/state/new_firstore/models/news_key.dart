import 'package:flutter/foundation.dart' show immutable;

@immutable
class PostKey {
  static const source = "source";
  static const newsId = 'id';
  static const name = 'name';
  static const author = 'author';
  static const title = 'title';
  static const description = 'description';
  static const url = 'url';
  static const urlToImage = 'urlToImage';
  static const publishedAt = 'publishedAt';
  static const content = 'content';

  const PostKey._();
}
