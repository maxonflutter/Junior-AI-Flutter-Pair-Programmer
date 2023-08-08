// PROMPT: Create a BLoC to handle the product information and the user 
// inputs on the product screen of an ecommerce app 

// Output from: https://junior.atomsbox.com/#/bloc-generator

part of 'product_bloc.dart';

import 'package:equatable/equatable.dart';

enum ProductStatus { loading, loaded, error }

class ProductState extends Equatable {
  final ProductStatus status;
  final dynamic product;
  final int quantity;
  final double totalPrice;

  const ProductState({
    this.status = ProductStatus.loading,
    this.product,
    this.quantity = 1,
    this.totalPrice = 0.0,
  });

  ProductState copyWith({
    ProductStatus? status,
    dynamic? product,
    int? quantity,
    double? totalPrice,
  }) {
    return ProductState(
      status: status ?? this.status,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }

  @override
  List<Object?> get props => [status, product, quantity, totalPrice];
}