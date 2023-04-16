import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:qwique/state/api/model/news_model.dart';
import 'package:qwique/state/api/secret_key.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qwique/state/new_firstore/models/news_key.dart';

class News {
  List<Article> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/everything?q=tesla&from=2023-03-15&sortBy=publishedAt&apiKey=$apiKey";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    print('...json $jsonData');
    await FirebaseFirestore.instance.collection("News").add(
          jsonData['articles'],
        );
    // if (jsonData['status'] == "ok") {
    //   jsonData["articles"].forEach((element) {
    //     if (element['urlToImage'] != null && element['description'] != null) {
    //       Article article = Article(
    //         title: element['title'] ?? "ok",
    //         author: element['author'] ?? "ok",
    //         description: element['description'],
    //         urlToImage: element['urlToImage'],
    //         publishedAt: element['publishedAt'],
    //         content: element["content"],
    //         articleUrl: element["url"],
    //       );
    //       news.add(article);
    //     }
    //   });
    // }
  }
}

class NewsForCategorie {
  List<Article> news = [];

  Future<void> getNewsForCategory(String category) async {
    /*String url = "http://newsapi.org/v2/everything?q=$category&apiKey=${apiKey}";*/
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=$apiKey";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    await FirebaseFirestore.instance.collection("News").add(
          jsonData['category'],
        );
    // if (jsonData['status'] == "ok") {
    //   jsonData["articles"].map((element) {
    //     if (element['urlToImage'] != null && element['description'] != null) {
    //       Article article = Article(
    //         title: element['title'] ?? "",
    //         author: element['author'] ?? "k",
    //         description: element['description'],
    //         urlToImage: element['urlToImage'],
    //         publishedAt: element['publishedAt'],
    //         content: element["content"] ?? "ok",
    //         articleUrl: element["url"],
    //       );
    //       news.add(article);
    //       FirebaseFirestore.instance.collection(PostKey.source).add(
    //             article,
    //           );
    //     }
    //   });
    // }
  }
}
