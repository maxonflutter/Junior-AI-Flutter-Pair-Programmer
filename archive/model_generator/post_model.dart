// PROMPT: Create a post model for a social media app
// Output from: https://junior.atomsbox.com/#/model-generator

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Post extends Equatable {
  final String id;
  final String title;
  final String body;
  final String imageUrl;

  const Post({
    required this.id,
    required this.title,
    required this.body,
    required this.imageUrl,
  });
  
  Post copyWith({
    String? id,
    String? title,
    String? body,
    String? imageUrl,
  }) {
    return Post(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] ?? Uuid().v4(),
      title: json['title'] ?? "",
      body: json['body'] ?? "",
      imageUrl:
          json['imageUrl'] ?? "https://source.unsplash.com/random/?city,night",
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'imageUrl': imageUrl,
    };
  }

  static List<Post> getSampleData() {
    return [
      Post(
        id: Uuid().v4(),
        title: "My first post",
        body: "Hello world!",
        imageUrl: "https://source.unsplash.com/random/?city,night",
      ),
      Post(
        id: Uuid().v4(),
        title: "My second post",
        body: "This is my second post",
        imageUrl: "https://source.unsplash.com/random/?city,night",
      ),
      Post(
        id: Uuid().v4(),
        title: "My third post",
        body: "This is my third post",
        imageUrl: "https://source.unsplash.com/random/?city,night",
      ),
    ];
  }

  @override
  List<Object?> get props => [id, title, body, imageUrl];
}
