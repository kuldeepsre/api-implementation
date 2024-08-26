import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import '../../model/ProductDto.dart';

part 'product_dashboard_event.dart';
part 'product_dashboard_state.dart';

class ProductDashboardBloc extends Bloc<ProductDashboardEvent, ProductDashboardState> {
  ProductDashboardBloc() : super(ProductDashboardInitial()) {
    on<LoadProducts>(_onLoadProducts);
    on<AddToCart>(_onAddToCart);
    on<IncrementProduct>(_onIncrementProduct);
    on<DecrementProduct>(_onDecrementProduct);
    on<CheckoutCart>(_onCheckoutCart);
  }
  void _onLoadProducts(LoadProducts event, Emitter<ProductDashboardState> emit) async {
    emit(ProductLoading());
    try {
      // Load JSON file as a string
      final String response = await rootBundle.loadString('assets/product.json');
      final List<dynamic> data = json.decode(response);
      // Parse JSON data into a list of Product instances
      List<ProductDto> products = data.map((product) => ProductDto.fromJson(product)).toList();
      // Categorize products
      List<ProductDto> newArrivals = products
          .where((product) => product.category == 'new_arrival')
          .toList();
      List<ProductDto> popularProducts = products
          .where((product) => product.category == 'popular')
          .toList();

      emit(ProductLoaded(newArrivals: newArrivals, popularProducts: popularProducts, cart: []));
    } catch (e) {
      emit(ProductError('Failed to load products'));
    }
  }

  void _onAddToCart(AddToCart event, Emitter<ProductDashboardState> emit) {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;
      final updatedCart = List<ProductDto>.from(currentState.cart);

      // Check if the product is already in the cart
      final productIndex = updatedCart.indexWhere((product) => product.id == event.product.id);
      if (productIndex != -1) {
        // Increment the quantity if product already exists in the cart
        updatedCart[productIndex].quantity++;
      } else {
        // Add new product to the cart
        updatedCart.add(event.product);
      }

      emit(ProductLoaded(
        newArrivals: currentState.newArrivals,
        popularProducts: currentState.popularProducts,
        cart: updatedCart,
      ));
    }
  }

  void _onIncrementProduct(IncrementProduct event, Emitter<ProductDashboardState> emit) {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;
      final updatedCart = List<ProductDto>.from(currentState.cart);

      final productIndex = updatedCart.indexWhere((product) => product.id == event.product.id);
      if (productIndex != -1) {
        updatedCart[productIndex].quantity++;
        emit(ProductLoaded(
          newArrivals: currentState.newArrivals,
          popularProducts: currentState.popularProducts,
          cart: updatedCart,
        ));
      }
    }
  }

  void _onDecrementProduct(DecrementProduct event, Emitter<ProductDashboardState> emit) {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;
      final updatedCart = List<ProductDto>.from(currentState.cart);

      final productIndex = updatedCart.indexWhere((product) => product.id == event.product.id);
      if (productIndex != -1 && updatedCart[productIndex].quantity > 1) {
        updatedCart[productIndex].quantity--;
        emit(ProductLoaded(
          newArrivals: currentState.newArrivals,
          popularProducts: currentState.popularProducts,
          cart: updatedCart,
        ));
      } else if (productIndex != -1 && updatedCart[productIndex].quantity == 1) {
        // Remove product if quantity becomes zero
        updatedCart.removeAt(productIndex);
        emit(ProductLoaded(
          newArrivals: currentState.newArrivals,
          popularProducts: currentState.popularProducts,
          cart: updatedCart,
        ));
      }
    }
  }

  void _onCheckoutCart(CheckoutCart event, Emitter<ProductDashboardState> emit) {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;
      final totalCost = currentState.cart.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
      emit(CheckoutSuccess(totalCost));
    }
  }

}
