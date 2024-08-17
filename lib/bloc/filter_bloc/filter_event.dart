part of 'filter_bloc.dart';

// Define Filter Events
abstract class FilterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ToggleOutOfStock extends FilterEvent {
  final bool isChecked;
  ToggleOutOfStock(this.isChecked);

  @override
  List<Object> get props => [isChecked];
}

class ChangeCategory extends FilterEvent {
  final String category;
  ChangeCategory(this.category);

  @override
  List<Object> get props => [category];
}

class ChangePriceRange extends FilterEvent {
  final RangeValues range;
  ChangePriceRange(this.range);

  @override
  List<Object> get props => [range];
}
class ApplyFilters extends FilterEvent {
  final bool isOutOfStock;
  final String category;
  final RangeValues priceRange;

  ApplyFilters({
    required this.isOutOfStock,
    required this.category,
    required this.priceRange,
  });

  @override
  List<Object> get props => [isOutOfStock, category, priceRange];
}

