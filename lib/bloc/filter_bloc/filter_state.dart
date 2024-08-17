part of 'filter_bloc.dart';

// Define Filter States
class FilterState extends Equatable {
  final bool isOutOfStock;
  final String category;
  final RangeValues priceRange;

  FilterState({
    this.isOutOfStock = false,
    this.category = 'All',
    this.priceRange = const RangeValues(0, 1000),
  });

  FilterState copyWith({
    bool? isOutOfStock,
    String? category,
    RangeValues? priceRange,
  }) {
    return FilterState(
      isOutOfStock: isOutOfStock ?? this.isOutOfStock,
      category: category ?? this.category,
      priceRange: priceRange ?? this.priceRange,
    );
  }

  @override
  List<Object> get props => [isOutOfStock, category, priceRange];
}