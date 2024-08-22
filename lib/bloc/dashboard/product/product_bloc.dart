import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import '../../../model/Category.dart';
import '../../../model/Product.dart';

part 'product_event.dart';
part 'product_state.dart';

// BLoC
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  List<Product> _allProducts = [];

  ProductBloc() : super(ProductInitial()) {
    on<LoadProducts>(_onLoadProducts);
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final jsonString = await rootBundle.loadString('assets/products.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    _allProducts = jsonData.map((data) => Product.fromJson(data)).toList();
    print('Loaded Products: ${_allProducts.first}'); // Debug print
      }
    void _onLoadProducts(LoadProducts event, Emitter<ProductState> emit) {
      // Debugging
      print('Category ID: ${event.categoryId}');

      final products = _allProducts
          .where((product) => product.categoryId == event.categoryId)
          .toList();

      // Debugging
      print('Filtered Products: ${products}');
      print('_allProducts _allProducts: ${_allProducts}');


      emit(ProductsLoaded(products));
  }
}