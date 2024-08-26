part of 'product_dashboard_bloc.dart';

abstract class ProductDashboardState {}

class ProductDashboardInitial extends ProductDashboardState {}

class ProductLoading extends ProductDashboardState {}

class ProductLoaded extends ProductDashboardState {
  final List<ProductDto> newArrivals;
  final List<ProductDto> popularProducts;
  final List<ProductDto> cart;
  final int cartCount;
  ProductLoaded({
    required this.newArrivals,
    required this.popularProducts,
    required this.cart,
  }) : cartCount = cart.fold(0, (sum, item) => sum + item.quantity);

}
class CheckoutSuccess extends ProductDashboardState {
  final double totalCost;

  CheckoutSuccess(this.totalCost);
}
class ProductError extends ProductDashboardState {
  final String message;

  ProductError(this.message);
}
