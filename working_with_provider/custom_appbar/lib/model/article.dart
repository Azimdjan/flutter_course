// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.status,
    this.totalResults,
    this.articles,
  });

  final String status;
  final int totalResults;
  final List<Article> articles;

  Welcome copyWith({
    String status,
    int totalResults,
    List<Article> articles,
  }) =>
      Welcome(
        status: status ?? this.status,
        totalResults: totalResults ?? this.totalResults,
        articles: articles ?? this.articles,
      );

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}

class Article {
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  final Source source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;
  final String content;

  Article copyWith({
    Source source,
    String author,
    String title,
    String description,
    String url,
    String urlToImage,
    DateTime publishedAt,
    String content,
  }) =>
      Article(
        source: source ?? this.source,
        author: author ?? this.author,
        title: title ?? this.title,
        description: description ?? this.description,
        url: url ?? this.url,
        urlToImage: urlToImage ?? this.urlToImage,
        publishedAt: publishedAt ?? this.publishedAt,
        content: content ?? this.content,
      );

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    source: Source.fromJson(json["source"]),
    author: json["author"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "source": source.toJson(),
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt.toIso8601String(),
    "content": content,
  };
}

class Source {
  Source({
    this.id,
    this.name,
  });

  final Id id;
  final Name name;

  Source copyWith({
    Id id,
    Name name,
  }) =>
      Source(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: json["id"] == null ? null : idValues.map[json["id"]],
    name: nameValues.map[json["name"]],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : idValues.reverse[id],
    "name": nameValues.reverse[name],
  };
}

enum Id { THE_VERGE, ENGADGET, WIRED }

final idValues = EnumValues({
  "engadget": Id.ENGADGET,
  "the-verge": Id.THE_VERGE,
  "wired": Id.WIRED
});

enum Name { LIFEHACKER_COM, THE_VERGE, ENGADGET, WIRED }

final nameValues = EnumValues({
  "Engadget": Name.ENGADGET,
  "Lifehacker.com": Name.LIFEHACKER_COM,
  "The Verge": Name.THE_VERGE,
  "Wired": Name.WIRED
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
