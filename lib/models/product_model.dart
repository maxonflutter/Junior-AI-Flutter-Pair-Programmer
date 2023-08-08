import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = Uuid();

class Product extends Equatable {
  final String id;
  final String name;
  final double price;
  final String color;
  final String description;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.color,
    required this.description,
    required this.imageUrl,
  });

  Product copyWith({
    String? id,
    String? name,
    double? price,
    String? color,
    String? description,
    String? imageUrl,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      color: color ?? this.color,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  List<Object> get props => [id, name, price, color, description, imageUrl];

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      price: json['price'] ?? 0.0,
      color: json['color'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'color': color,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  static List<Product> sampleData = [
    Product(
      id: uuid.v4(),
      name: 'Product 1',
      price: 99.99,
      color: 'Red',
      description: 'This is a description for product 1',
      imageUrl: 'https://source.unsplash.com/random/?product',
    ),
    Product(
      id: uuid.v4(),
      name: 'Product 2',
      price: 199.99,
      color: 'Blue',
      description: 'This is a description for product 2',
      imageUrl: 'https://source.unsplash.com/random/?product',
    ),
  ];
}