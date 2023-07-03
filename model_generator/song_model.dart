// PROMPT: Create a song model for a music player app
// Output from: https://junior.atomsbox.com/#/model-generator

import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Song extends Equatable {
  final String id;
  final String title;
  final String artist;
  final String album;
  final String imageUrl;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.imageUrl,
  });

  Song copyWith({
    String? id,
    String? title,
    String? artist,
    String? album,
    String? imageUrl,
  }) {
    return Song(
      id: id ?? this.id,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      album: album ?? this.album,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      id: json['id'] ?? Uuid().v4(),
      title: json['title'] ?? "",
      artist: json['artist'] ?? "",
      album: json['album'] ?? "",
      imageUrl: json['imageUrl'] ?? "https://source.unsplash.com/random/?city,night",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'album': album,
      'imageUrl': imageUrl,
    };
  }

  static List<Song> getSampleData() {
    return [
      Song(
        id: Uuid().v4(),
        title: "Song 1",
        artist: "Artist 1",
        album: "Album 1",
        imageUrl: "https://source.unsplash.com/random/?city,night",
      ),
      Song(
        id: Uuid().v4(),
        title: "Song 2",
        artist: "Artist 2",
        album: "Album 2",
        imageUrl: "https://source.unsplash.com/random/?city,night",
      ),
      Song(
        id: Uuid().v4(),
        title: "Song 3",
        artist: "Artist 3",
        album: "Album 3",
        imageUrl: "https://source.unsplash.com/random/?city,night",
      ),
    ];
  }

  @override
  List<Object?> get props => [id, title, artist, album, imageUrl];
}