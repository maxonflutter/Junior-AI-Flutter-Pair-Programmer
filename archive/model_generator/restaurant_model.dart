// PROMPT: Create a restaurant model for a food delivery app
// Output from: https://junior.atomsbox.com/#/model-generator

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:uuid/uuid.dart';

class Restaurant extends Equatable {
  final String id;
  final String name;
  final String address;
  final String imageUrl;
  final double rating;
  final List<String> categories;

  Restaurant({
    String? id,
    required this.name,
    required this.address,
    required this.imageUrl,
    required this.rating,
    required this.categories,
  }) : id = id ?? Uuid().v4();

  Restaurant copyWith({
    String? name,
    String? address,
    String? imageUrl,
    double? rating,
    List<String>? categories,
  }) {
    return Restaurant(
      id: this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      imageUrl: imageUrl ?? this.imageUrl,
      rating: rating ?? this.rating,
      categories: categories ?? this.categories,
    );
  }

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json["id"] ?? Uuid().v4(),
      name: json["name"] ?? "",
      address: json["address"] ?? "",
      imageUrl: json["imageUrl"] ?? "https://source.unsplash.com/random/?food",
      rating: json["rating"]?.toDouble() ?? 0.0,
      categories: List<String>.from(json["categories"] ?? []),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "address": address,
      "imageUrl": imageUrl,
      "rating": rating,
      "categories": categories,
    };
  }
  
  static List<Restaurant> getSampleData() {
    return [
      Restaurant(
        name: "Burger King",
        address: "123 Main St",
        imageUrl: "https://source.unsplash.com/random/?burger",
        rating: 4.5,
        categories: ["Fast Food", "Burgers"],
      ),
      Restaurant(
        name: "Pizza Hut",
        address: "456 Elm St",
        imageUrl: "https://source.unsplash.com/random/?pizza",
        rating: 4.2,
        categories: ["Italian", "Pizza"],
      ),
      Restaurant(
        name: "Taco Bell",
        address: "789 Oak St",
        imageUrl: "https://source.unsplash.com/random/?taco",
        rating: 3.9,
        categories: ["Mexican", "Fast Food"],
      ),
    ];
  }
  
  @override
  List<Object?> get props => [id, name, address, imageUrl, rating, categories];
}
