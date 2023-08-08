// PROMPT: Create a BLoC to handle the product information and the user 
// inputs on the product screen of an ecommerce app 

// Output from: https://junior.atomsbox.com/#/bloc-generator

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  final StreamSubscription<Product> _productSubscription;

  ProductBloc({
    required ProductRepository productRepository,
  })  : _productRepository = productRepository,
        super(const ProductState()) {
    on<ProductLoadEvent>(_onProductLoadEvent);
    on<ProductUpdateQuantityEvent>(_onProductUpdateQuantityEvent);
    on<ProductAddToCartEvent>(_onProductAddToCartEvent);
    on<ProductRemoveFromCartEvent>(_onProductRemoveFromCartEvent);

    _productSubscription = _productRepository.productStream().listen(_productChanged);
  }

  void _productChanged(Product product) => add(ProductLoadEvent(product));

  Future<void> _onProductLoadEvent(
    ProductLoadEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(status: ProductStatus.loading));

    try {
      final product = await _productRepository.getProduct(event.productId);
      emit(
        state.copyWith(
          status: ProductStatus.loaded,
          product: product,
        ),
      );
    } catch (err) {
      emit(state.copyWith(status: ProductStatus.error));
    }
  }

  Future<void> _onProductUpdateQuantityEvent(
    ProductUpdateQuantityEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(state.copyWith(quantity: event.quantity, totalPrice: state.product.price * event.quantity));
  }

  Future<void> _onProductAddToCartEvent(
    ProductAddToCartEvent event,
    Emitter<ProductState> emit,
  ) async {
    try {
      await _productRepository.addToCart(event.productId, state.quantity);
      emit(state.copyWith(status: ProductStatus.loaded));
    } catch (err) {
      emit(state.copyWith(status: ProductStatus.error));
    }
  }

  Future<void> _onProductRemoveFromCartEvent(
    ProductRemoveFromCartEvent event,
    Emitter<ProductState> emit,
  ) async {
    try {
      await _productRepository.removeFromCart(event.productId);
      emit(state.copyWith(status: ProductStatus.loaded));
    } catch (err) {
      emit(state.copyWith(status: ProductStatus.error));
    }
  }

  @override
  Future<void> close() {
    _productSubscription.cancel();
    return super.close();
  }
}
