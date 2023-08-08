// Output from: https://junior.atomsbox.com/#/unit-test-generator

// PROMPT: 
"""
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
"""

import 'package:test/test.dart';
import 'package:your_package_name/article.dart';

void main() {
  group('Article', () {
    test('copyWith method returns a new Article instance with updated values', () {
      final article = Article(
        id: '1',
        title: 'Test Title',
        description: 'Test Description',
        imageUrl: 'https://test.com/image.jpg',
        author: 'Test Author',
        date: DateTime.now(),
      );

      final updatedArticle = article.copyWith(
        title: 'Updated Title',
        description: 'Updated Description',
        imageUrl: 'https://test.com/updated-image.jpg',
        author: 'Updated Author',
      );

      expect(updatedArticle.title, 'Updated Title');
      expect(updatedArticle.description, 'Updated Description');
      expect(updatedArticle.imageUrl, 'https://test.com/updated-image.jpg');
      expect(updatedArticle.author, 'Updated Author');
    });

    test('fromJson method returns a valid Article instance from a JSON input', () {
      final json = {
        'id': '1',
        'title': 'Test Title',
        'description': 'Test Description',
        'imageUrl': 'https://test.com/image.jpg',
        'author': 'Test Author',
        'date': DateTime.now().toString(),
      };

      final article = Article.fromJson(json);

      expect(article.id, '1');
      expect(article.title, 'Test Title');
      expect(article.description, 'Test Description');
      expect(article.imageUrl, 'https://test.com/image.jpg');
      expect(article.author, 'Test Author');
    });

    test('toJson method returns a valid JSON output from an Article instance', () {
      final article = Article(
        id: '1',
        title: 'Test Title',
        description: 'Test Description',
        imageUrl: 'https://test.com/image.jpg',
        author: 'Test Author',
        date: DateTime.now(),
      );

      final json = article.toJson();

      expect(json['id'], '1');
      expect(json['title'], 'Test Title');
      expect(json['description'], 'Test Description');
      expect(json['imageUrl'], 'https://test.com/image.jpg');
      expect(json['author'], 'Test Author');
    });

    test('getSampleData method returns a list of valid Article instances', () {
      final sampleData = Article.getSampleData();

      expect(sampleData, isNotEmpty);
      expect(sampleData, isInstanceOf<List<Article>>());
      expect(sampleData[0], isInstanceOf<Article>());
    });

    test('props list returns a list of all Article properties', () {
      final article = Article(
        id: '1',
        title: 'Test Title',
        description: 'Test Description',
        imageUrl: 'https://test.com/image.jpg',
        author: 'Test Author',
        date: DateTime.now(),
      );

      final props = article.props;

      expect(props, [
        article.id,
        article.title,
        article.description,
        article.imageUrl,
        article.author,
        article.date,
      ]);
    });
  });
}