// Output from: https://junior.atomsbox.com/#/unit-test-generator

// PROMPT: 
"""
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class MovieReview extends Equatable {
  final String id;
  final String title;
  final String description;
  final double rating;
  final String imageUrl;

  const MovieReview({
    required this.id,
    required this.title,
    required this.description,
    required this.rating,
    required this.imageUrl,
  });

  MovieReview copyWith({
    String? id,
    String? title,
    String? description,
    double? rating,
    String? imageUrl,
  }) {
    return MovieReview(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      rating: rating ?? this.rating,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  factory MovieReview.fromJson(Map<String, dynamic> json) {
    return MovieReview(
      id: json["id"] ?? Uuid().v4(),
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      rating: json["rating"] ?? 0.0,
      imageUrl:
          json["imageUrl"] ?? "https://source.unsplash.com/random/?city,night",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "rating": rating,
      "imageUrl": imageUrl,
    };
  }

  static List<MovieReview> getSampleData() {
    return [
      MovieReview(
        id: Uuid().v4(),
        title: "The Godfather",
        description:
            "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
        rating: 9.2,
        imageUrl:
            "https://images.unsplash.com/photo-1552083375-142875a901a1?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dGhlJTIwZ29kZmF0ZXIlMjBmaW5hbmNlfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
      ),
      MovieReview(
        id: Uuid().v4(),
        title: "The Shawshank Redemption",
        description:
            "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
        rating: 9.3,
        imageUrl:
            "https://images.unsplash.com/photo-1519681393784-d120267933ba?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fHRoZSUyMHNob3dzaGFya25lcHJvZHVjdGlvbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
      ),
      MovieReview(
        id: Uuid().v4(),
        title: "The Dark Knight",
        description:
            "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
        rating: 9.0,
        imageUrl:
            "https://images.unsplash.com/photo-1542281286-9e0a16bb7366?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dGhlJTIwZGFyayUyMGtuaWdodHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",
      ),
    ];
  }

  @override
  List<Object?> get props => [id, title, description, rating, imageUrl];
}
"""

import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';
import 'package:equatable/equatable.dart';

import 'movie_review.dart';

void main() {
  test('copyWith method returns a new instance of MovieReview with updated values', () {
    final movieReview = MovieReview(
      id: '1',
      title: 'Test Title',
      description: 'Test Description',
      rating: 5.0,
      imageUrl: 'https://test.com/image.jpg',
    );

    final updatedMovieReview = movieReview.copyWith(
      title: 'Updated Title',
      description: 'Updated Description',
      rating: 4.5,
      imageUrl: 'https://test.com/updated_image.jpg',
    );

    expect(updatedMovieReview.title, 'Updated Title');
    expect(updatedMovieReview.description, 'Updated Description');
    expect(updatedMovieReview.rating, 4.5);
    expect(updatedMovieReview.imageUrl, 'https://test.com/updated_image.jpg');
  });

  test('toJson method returns a Map with all MovieReview properties', () {
    final movieReview = MovieReview(
      id: '1',
      title: 'Test Title',
      description: 'Test Description',
      rating: 5.0,
      imageUrl: 'https://test.com/image.jpg',
    );

    final json = movieReview.toJson();

    expect(json['id'], '1');
    expect(json['title'], 'Test Title');
    expect(json['description'], 'Test Description');
    expect(json['rating'], 5.0);
    expect(json['imageUrl'], 'https://test.com/image.jpg');
  });

  test('fromJson method returns a MovieReview instance with correct values', () {
    final json = {
      "id": "1",
      "title": "Test Title",
      "description": "Test Description",
      "rating": 5.0,
      "imageUrl": "https://test.com/image.jpg",
    };

    final movieReview = MovieReview.fromJson(json);

    expect(movieReview.id, '1');
    expect(movieReview.title, 'Test Title');
    expect(movieReview.description, 'Test Description');
    expect(movieReview.rating, 5.0);
    expect(movieReview.imageUrl, 'https://test.com/image.jpg');
  });

  test('getSampleData method returns a List<MovieReview> with correct values', () {
    final sampleData = MovieReview.getSampleData();

    expect(sampleData, isA<List<MovieReview>>());
    expect(sampleData.length, greaterThanOrEqualTo(1));
  });

  test('props list returns a List<Object?> with all MovieReview properties', () {
    final movieReview = MovieReview(
      id: '1',
      title: 'Test Title',
      description: 'Test Description',
      rating: 5.0,
      imageUrl: 'https://test.com/image.jpg',
    );

    final props = movieReview.props;

    expect(props, isA<List<Object?>>());
    expect(props, [
      '1',
      'Test Title',
      'Test Description',
      5.0,
      'https://test.com/image.jpg',
    ]);
  });
}