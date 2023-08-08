// PROMPT: Create a BLoC to handle the product information and the user 
// inputs on the product screen of an ecommerce app 

// Output from: https://junior.atomsbox.com/#/bloc-generator

part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class ProductLoadEvent extends ProductEvent {
  const ProductLoadEvent();
}

class ProductUpdateQuantityEvent extends ProductEvent {
  final int quantity;

  const ProductUpdateQuantityEvent({required this.quantity});

  @override
  List<Object> get props => [quantity];
}

class ProductAddToCartEvent extends ProductEvent {
  const ProductAddToCartEvent();
}

class ProductRemoveFromCartEvent extends ProductEvent {
  const ProductRemoveFromCartEvent();
}