// To parse this JSON data, do
//
//     final newsCatcher = newsCatcherFromJson(jsonString);

import 'dart:convert';

NewsCatcher newsCatcherFromJson(String str) =>
    NewsCatcher.fromJson(json.decode(str));

class NewsCatcher {
  String? status;
  int? totalHits;
  int? page;
  int? totalPages;
  int? pageSize;
  List<Article>? articles;
  UserInput? userInput;

  NewsCatcher({
    this.status,
    this.totalHits,
    this.page,
    this.totalPages,
    this.pageSize,
    this.articles,
    this.userInput,
  });

  factory NewsCatcher.fromJson(Map<String, dynamic> json) => NewsCatcher(
        status: json["status"],
        totalHits: json["total_hits"],
        page: json["page"],
        totalPages: json["total_pages"],
        pageSize: json["page_size"],
        articles: json["articles"] == null
            ? []
            : List<Article>.from(
                json["articles"]!.map((x) => Article.fromJson(x))),
        userInput: json["user_input"] == null
            ? null
            : UserInput.fromJson(json["user_input"]),
      );
}

class Article {
  String? title;
  String? author;
  DateTime? publishedDate;
  String? publishedDatePrecision;
  String? link;
  String? cleanUrl;
  String? excerpt;
  String? summary;
  String? rights;
  int? rank;
  String? topic;
  String? country;
  String? language;
  String? authors;
  String? media;
  bool? isOpinion;
  String? twitterAccount;
  double? score;
  String? id;

  Article({
    this.title,
    this.author,
    this.publishedDate,
    this.publishedDatePrecision,
    this.link,
    this.cleanUrl,
    this.excerpt,
    this.summary,
    this.rights,
    this.rank,
    this.topic,
    this.country,
    this.language,
    this.authors,
    this.media,
    this.isOpinion,
    this.twitterAccount,
    this.score,
    this.id,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        title: json["title"],
        author: json["author"],
        publishedDate: json["published_date"] == null
            ? null
            : DateTime.parse(json["published_date"]),
        publishedDatePrecision: json["published_date_precision"],
        link: json["link"],
        cleanUrl: json["clean_url"],
        excerpt: json["excerpt"],
        summary: json["summary"],
        rights: json["rights"],
        rank: json["rank"],
        topic: json["topic"],
        country: json["country"],
        language: json["language"],
        authors: json["authors"],
        media: json["media"],
        isOpinion: json["is_opinion"],
        twitterAccount: json["twitter_account"],
        score: json["_score"]?.toDouble(),
        id: json["_id"],
      );
}

class UserInput {
  String? q;
  List<String>? searchIn;
  List<String>? lang;
  dynamic notLang;
  dynamic countries;
  dynamic notCountries;
  DateTime? from;
  dynamic to;
  String? rankedOnly;
  dynamic fromRank;
  dynamic toRank;
  String? sortBy;
  int? page;
  int? size;
  dynamic sources;
  List<dynamic>? notSources;
  dynamic topic;
  dynamic publishedDatePrecision;

  UserInput({
    this.q,
    this.searchIn,
    this.lang,
    this.notLang,
    this.countries,
    this.notCountries,
    this.from,
    this.to,
    this.rankedOnly,
    this.fromRank,
    this.toRank,
    this.sortBy,
    this.page,
    this.size,
    this.sources,
    this.notSources,
    this.topic,
    this.publishedDatePrecision,
  });

  factory UserInput.fromJson(Map<String, dynamic> json) => UserInput(
        q: json["q"],
        searchIn: json["search_in"] == null
            ? []
            : List<String>.from(json["search_in"]!.map((x) => x)),
        lang: json["lang"] == null
            ? []
            : List<String>.from(json["lang"]!.map((x) => x)),
        notLang: json["not_lang"],
        countries: json["countries"],
        notCountries: json["not_countries"],
        from: json["from"] == null ? null : DateTime.parse(json["from"]),
        to: json["to"],
        rankedOnly: json["ranked_only"],
        fromRank: json["from_rank"],
        toRank: json["to_rank"],
        sortBy: json["sort_by"],
        page: json["page"],
        size: json["size"],
        sources: json["sources"],
        notSources: json["not_sources"] == null
            ? []
            : List<dynamic>.from(json["not_sources"]!.map((x) => x)),
        topic: json["topic"],
        publishedDatePrecision: json["published_date_precision"],
      );
}
