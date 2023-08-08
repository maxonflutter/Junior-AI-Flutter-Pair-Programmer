// PROMPT: Create a BLoC to manage the state of the cart for an ecommerce
// Flutter application

// Output from: https://junior.atomsbox.com/#/bloc-generator

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository _cartRepository;
  final StreamSubscription<CartItem> _cartSubscription;

  CartBloc({
    required CartRepository cartRepository,
  })  : _cartRepository = cartRepository,
        super(const CartState()) {
    on<CartAddItemEvent>(_onAddItem);
    on<CartRemoveItemEvent>(_onRemoveItem);
    on<CartUpdateQuantityEvent>(_onUpdateQuantity);
    on<CartClearEvent>(_onClearCart);

    _cartSubscription = _cartRepository.cartStream().listen(_cartChanged);
  }

  void _cartChanged(CartItem cartItem) => add(CartAddItemEvent(cartItem));

  Future<void> _onAddItem(
    CartAddItemEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(state.copyWith(status: CartStatus.loading));

    try {
      final cartItems = await _cartRepository.addItem(event.item);
      final totalPrice = await _cartRepository.calculateTotalPrice();
      emit(
        state.copyWith(
          status: CartStatus.loaded,
          cartItems: cartItems,
          totalPrice: totalPrice,
        ),
      );
    } catch (err) {
      emit(state.copyWith(status: CartStatus.error));
    }
  }

  Future<void> _onRemoveItem(
    CartRemoveItemEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(state.copyWith(status: CartStatus.loading));

    try {
      final cartItems = await _cartRepository.removeItem(event.item);
      final totalPrice = await _cartRepository.calculateTotalPrice();
      emit(
        state.copyWith(
          status: CartStatus.loaded,
          cartItems: cartItems,
          totalPrice: totalPrice,
        ),
      );
    } catch (err) {
      emit(state.copyWith(status: CartStatus.error));
    }
  }

  Future<void> _onUpdateQuantity(
    CartUpdateQuantityEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(state.copyWith(status: CartStatus.loading));

    try {
      final cartItems = await _cartRepository.updateQuantity(event.item, event.quantity);
      final totalPrice = await _cartRepository.calculateTotalPrice();
      emit(
        state.copyWith(
          status: CartStatus.loaded,
          cartItems: cartItems,
          totalPrice: totalPrice,
        ),
      );
    } catch (err) {
      emit(state.copyWith(status: CartStatus.error));
    }
  }

  Future<void> _onClearCart(
    CartClearEvent event,
    Emitter<CartState> emit,
  ) async {
    emit(state.copyWith(status: CartStatus.loading));

    try {
      await _cartRepository.clearCart();
      emit(
        state.copyWith(
          status: CartStatus.loaded,
          cartItems: [],
          totalPrice: 0,
        ),
      );
    } catch (err) {
      emit(state.copyWith(status: CartStatus.error));
    }
  }

  @override
  Future<void> close() {
    _cartSubscription.cancel();
    return super.close();
  }
}
```