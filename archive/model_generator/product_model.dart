// PROMPT: Create the product model for an e-commerce app
// Output from: https://junior.atomsbox.com/#/model-generator

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? Uuid().v4(),
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? 0.0,
      imageUrl: json['imageUrl'] ?? '',
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  static List<Product> getSampleProducts() {
    return [
      Product(
        id: Uuid().v4(),
        name: 'T-Shirt',
        description: 'Comfortable and stylish T-Shirt',
        price: 19.99,
        imageUrl: 'https://source.unsplash.com/random/?clothing,men',
      ),
      Product(
        id: Uuid().v4(),
        name: 'Sneakers',
        description: 'High-quality sneakers for any occasion',
        price: 79.99,
        imageUrl: 'https://source.unsplash.com/random/?shoes,men',
      ),
      Product(
        id: Uuid().v4(),
        name: 'Backpack',
        description: 'Spacious and durable backpack',
        price: 49.99,
        imageUrl: 'https://source.unsplash.com/random/?backpacks',
      ),
    ];
  }

  @override
  List<Object?> get props => [id, name, description, price, imageUrl];
}
