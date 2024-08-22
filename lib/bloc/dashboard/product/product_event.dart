part of 'product_bloc.dart';

// product_event.dart
// Events
abstract class ProductEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadProducts extends ProductEvent {
   dynamic categoryId;

  LoadProducts(this.categoryId);

  @override
  List<Object?> get props => [categoryId];
}