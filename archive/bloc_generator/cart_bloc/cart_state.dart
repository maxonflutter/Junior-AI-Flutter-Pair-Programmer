part of 'cart_bloc.dart';

enum CartStatus { initial, loading, loaded, error }

class CartState extends Equatable {
  final List<CartItem> cartItems;
  final double totalPrice;
  final CartStatus status;

  const CartState({
    this.cartItems = const [],
    this.totalPrice = 0.0,
    this.status = CartStatus.initial,
  });

  CartState copyWith({
    List<CartItem>? cartItems,
    double? totalPrice,
    CartStatus? status,
  }) {
    return CartState(
      cartItems: cartItems ?? this.cartItems,
      totalPrice: totalPrice ?? this.totalPrice,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [cartItems, totalPrice, status];
}