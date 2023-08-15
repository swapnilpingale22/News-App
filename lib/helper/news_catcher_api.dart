// ignore_for_file: unused_local_variable

import 'dart:convert';
// import 'package:flutter_news_app/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_news_app/models/newscatcher_model.dart';

class News {
  List<Article> news = [];

  Future<void> getNews() async {
    String apiKey = "wxGYC2ZZX4vV54T40KDEhc8JgfKhl3beyHXFsJ2EEwQ";

    String url =
        "https://api.newscatcherapi.com/v2/search?q=maharashtra&lang=mr";

    final Map<String, String> headers = {
      'x-api-key': 'wxGYC2ZZX4vV54T40KDEhc8JgfKhl3beyHXFsJ2EEwQ',
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      if (jsonData["status"] == "ok") {
        NewsCatcher newsCatcher = newsCatcherFromJson(response.body);

        for (var articleData in newsCatcher.articles!) {
          if (articleData.media != null && articleData.publishedDate != null) {
            Article article = Article(
              title: articleData.title ?? "---",
              author: articleData.author ?? "Unknown Author",
              excerpt: articleData.excerpt ?? "--",
              link: articleData.link ??
                  "https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en",
              media: articleData.media ??
                  "https://images.unsplash.com/photo-1574957747510-dc6b2fdaea1d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=50",
              publishedDate: articleData.publishedDate!,
              summary: articleData.summary ?? "--",
            );

            news.add(article);
          }
        }
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}

// class News {
//   List<Article> news = [];

//   Future<void> getNews() async {
//     //key for swapnilpingale1234@gmail.com
//     String apiKey = "wxGYC2ZZX4vV54T40KDEhc8JgfKhl3beyHXFsJ2EEwQ";

//     String url =
//         "https://api.newscatcherapi.com/v2/search?q=maharashtra&lang=mr";

//     final Map<String, String> headers = {
//       'x-api-key': 'wxGYC2ZZX4vV54T40KDEhc8JgfKhl3beyHXFsJ2EEwQ',
//     };

//     var response = await http.get(
//       Uri.parse(url),
//       headers: headers,
//     );

//     if (response.statusCode == 200) {
//       var jsonData = jsonDecode(response.body);
//       print(jsonData);

//       if (jsonData["status"] == "ok") {

//         jsonData["articles"].forEach(
//           (element) {
//             if (element["urlToImage"] != null &&
//                 element["publishedAt"] != null) {
//               Article article = Article(
//                 title: element['title'] ?? "---",
//                 author: element['author'] ?? "Unknown Author",
//                 subtitle: element['description'] ?? "--",
//                 url: element['url'] ??
//                     "https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en",
//                 imageUrl: element['urlToImage'] ??
//                     "https://images.unsplash.com/photo-1574957747510-dc6b2fdaea1d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=50",
//                 createdAt: DateTime.parse(element['publishedAt']),
//                 body: element['content'] ?? "--",
//               );

//               news.add(article);
//             } else {
//               // print("Missing values in JSON data: $element");
//             }
//           },
//         );
//       }
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }

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
              // ignore: prefer_typing_uninitialized_variables
              var articleData;
              Article article = Article(
                title: element['title'] ?? "---",
                author: element['author'] ?? "Unknown Author",
                excerpt: articleData.excerpt ?? "--",
                link: articleData.link ??
                    "https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en",
                media: articleData.media ??
                    "https://images.unsplash.com/photo-1574957747510-dc6b2fdaea1d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=50",
                publishedDate: articleData.publishedDate!,
                summary: articleData.summary ?? "--",
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
