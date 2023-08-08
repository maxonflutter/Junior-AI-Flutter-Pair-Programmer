// Output from: https://junior.atomsbox.com/#/unit-test-generator

// PROMPT: 
"""
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
"""

import 'package:test/test.dart';
import 'package:uuid/uuid.dart';
import 'package:equatable/equatable.dart';

import 'post.dart';

void main() {
  group('Post', () {
    test('copyWith method returns a new instance of Post with updated properties', () {
      final post = Post(
        id: Uuid().v4(),
        title: 'My first post',
        body: 'Hello world!',
        imageUrl: 'https://source.unsplash.com/random/?city,night',
      );

      final updatedPost = post.copyWith(title: 'Updated title', body: 'Updated body');

      expect(updatedPost.title, 'Updated title');
      expect(updatedPost.body, 'Updated body');
      expect(updatedPost.imageUrl, post.imageUrl);
      expect(updatedPost.id, post.id);
    });

    test('fromJson method returns a new instance of Post with correct properties', () {
      final json = {
        'id': '1',
        'title': 'My first post',
        'body': 'Hello world!',
        'imageUrl': 'https://source.unsplash.com/random/?city,night',
      };

      final post = Post.fromJson(json);

      expect(post.id, json['id']);
      expect(post.title, json['title']);
      expect(post.body, json['body']);
      expect(post.imageUrl, json['imageUrl']);
    });

    test('toJson method returns a Map with correct key-value pairs', () {
      final post = Post(
        id: '1',
        title: 'My first post',
        body: 'Hello world!',
        imageUrl: 'https://source.unsplash.com/random/?city,night',
      );

      final json = post.toJson();

      expect(json['id'], post.id);
      expect(json['title'], post.title);
      expect(json['body'], post.body);
      expect(json['imageUrl'], post.imageUrl);
    });

    test('getSampleData method returns a List of Post with correct length and properties', () {
      final sampleData = Post.getSampleData();

      expect(sampleData.length, 3);
      expect(sampleData[0].title, 'My first post');
      expect(sampleData[1].title, 'My second post');
      expect(sampleData[2].title, 'My third post');
    });

    test('props list returns a List of Object with correct values', () {
      final post = Post(
        id: '1',
        title: 'My first post',
        body: 'Hello world!',
        imageUrl: 'https://source.unsplash.com/random/?city,night',
      );

      final props = post.props;

      expect(props[0], post.id);
      expect(props[1], post.title);
      expect(props[2], post.body);
      expect(props[3], post.imageUrl);
    });
  });
}