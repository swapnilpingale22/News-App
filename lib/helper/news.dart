// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:math';
import 'package:flutter_news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  static List categories = [
    'Business',
    'Entertainment',
    'General',
    'Health',
    'Science',
    'Sports',
    'Technology',
  ];

  List<Article> news = [];

  Future<void> getNews() async {
    final random = Random();
    var myCategory = categories[random.nextInt(categories.length)];
    //key for swapnilpingale1234@gmail.com
    String apiKey1 = "065f46f48a6d4f3581a445174be1341b";
    //key for swapnilpingale22@gmail.com
    String apiKey2 = "51e0359f4e954083994784563901d99b";
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$myCategory&apiKey=$apiKey1";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      if (jsonData["status"] == "ok") {
        jsonData["articles"].forEach(
          (element) {
            if (element["urlToImage"] != null &&
                element["publishedAt"] != null) {
              Article article = Article(
                title: element['title'] ?? "---",
                author: element['author'] ?? "Unknown Author",
                subtitle: element['description'] ?? "--",
                url: element['url'] ??
                    "https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en",
                imageUrl: element['urlToImage'] ??
                    "https://images.unsplash.com/photo-1574957747510-dc6b2fdaea1d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=50",
                createdAt: DateTime.parse(element['publishedAt']),
                body: element['content'] ?? "--",
              );

              news.add(article);
            } else {
              // print("Missing values in JSON data: $element");
            }
          },
        );
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class CategoryNews {
  List<Article> news = [];

  Future<void> getNews(String category) async {
    //key for swapnilpingale1234@gmail.com
    String apiKey1 = "065f46f48a6d4f3581a445174be1341b";
    //key for swapnilpingale22@gmail.com
    String apiKey2 = "51e0359f4e954083994784563901d99b";
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=$apiKey1";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      if (jsonData["status"] == "ok") {
        jsonData["articles"].forEach(
          (element) {
            if (element["urlToImage"] != null &&
                element["publishedAt"] != null) {
              Article article = Article(
                title: element['title'] ?? "---",
                author: element['author'] ?? "Unknown Author",
                subtitle: element['description'] ?? "--",
                url: element['url'] ??
                    "https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en",
                imageUrl: element['urlToImage'] ??
                    "https://images.unsplash.com/photo-1574957747510-dc6b2fdaea1d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=50",
                createdAt: DateTime.parse(element['publishedAt']),
                body: element['content'] ?? "--",
              );

              news.add(article);
            } else {
              // print("Missing values in JSON data: $element");
            }
          },
        );
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}
