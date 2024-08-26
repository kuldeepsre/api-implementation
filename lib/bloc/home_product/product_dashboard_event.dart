part of 'product_dashboard_bloc.dart';

abstract class ProductDashboardEvent {}

class LoadProducts extends ProductDashboardEvent {}
class AddToCart extends ProductDashboardEvent {
  final ProductDto product;

  AddToCart(this.product);
}

class IncrementProduct extends ProductDashboardEvent {
  final ProductDto product;

  IncrementProduct(this.product);
}

class DecrementProduct extends ProductDashboardEvent {
  final ProductDto product;

  DecrementProduct(this.product);
}

class CheckoutCart extends ProductDashboardEvent {}