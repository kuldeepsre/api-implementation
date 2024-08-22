part of 'product_bloc.dart';

// product_state.dart
// States
abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductState {}

class ProductsLoaded extends ProductState {
  final List<Product> products;

  ProductsLoaded(this.products);

  @override
  List<Object?> get props => [products];
}
