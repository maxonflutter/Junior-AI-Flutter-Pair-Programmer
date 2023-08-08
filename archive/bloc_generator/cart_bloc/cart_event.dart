part of 'cart_bloc.dart';

import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartAddItemEvent extends CartEvent {
  final String itemId;

  const CartAddItemEvent(this.itemId);

  @override
  List<Object> get props => [itemId];
}

class CartRemoveItemEvent extends CartEvent {
  final String itemId;

  const CartRemoveItemEvent(this.itemId);

  @override
  List<Object> get props => [itemId];
}

class CartUpdateQuantityEvent extends CartEvent {
  final String itemId;
  final int quantity;

  const CartUpdateQuantityEvent(this.itemId, this.quantity);

  @override
  List<Object> get props => [itemId, quantity];
}

class CartClearEvent extends CartEvent {
  const CartClearEvent();
}