// PROMPT: Create an article model for a news app focused on sport news and competitions.

// Output from: https://junior.atomsbox.com/#/model-generator

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Article extends Equatable {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String author;
  final DateTime date;

  const Article({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.author,
    required this.date,
  });

  Article copyWith({
    String? id,
    String? title,
    String? description,
    String? imageUrl,
    String? author,
    DateTime? date,
  }) {
    return Article(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      author: author ?? this.author,
      date: date ?? this.date,
    );
  }

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'] ?? Uuid().v4(),
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      imageUrl: json['imageUrl'] ?? "https://source.unsplash.com/random/?city,night",
      author: json['author'] ?? "",
      date: DateTime.parse(json['date'] ?? DateTime.now().toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'author': author,
      'date': date.toString(),
    };
  }

  static List<Article> getSampleData() {
    return [
      Article(
        id: Uuid().v4(),
        title: "Lionel Messi wins Ballon d'Or for the seventh time",
        description:
            "Lionel Messi has won the Ballon d'Or for the seventh time, moving ahead of great rival Cristiano Ronaldo. Messi scored 41 goals in 52 appearances for club and country in 2021.",
        imageUrl: "https://source.unsplash.com/random/?sports",
        author: "John Doe",
        date: DateTime.now(),
      ),
      Article(
        id: Uuid().v4(),
        title: "Serena Williams retires from tennis",
        description:
            "Serena Williams has announced her retirement from professional tennis. Williams won 23 Grand Slam singles titles and 14 Grand Slam doubles titles in her career.",
        imageUrl: "https://source.unsplash.com/random/?tennis",
        author: "Jane Doe",
        date: DateTime.now(),
      ),
      Article(
        id: Uuid().v4(),
        title: "Tokyo Olympics 2021: USA wins gold in women's soccer",
        description:
            "The United States women's soccer team has won the gold medal at the Tokyo Olympics 2021. The team defeated Canada 2-1 in the final.",
        imageUrl: "https://source.unsplash.com/random/?soccer",
        author: "John Smith",
        date: DateTime.now(),
      ),
    ];
  }

  @override
  List<Object?> get props => [id, title, description, imageUrl, author, date];
}