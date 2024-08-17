import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'filter_event.dart';
part 'filter_state.dart';

// Define Filter BLoC using on
class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterState()) {
    on<ToggleOutOfStock>(_onToggleOutOfStock);
    on<ChangeCategory>(_onChangeCategory);
    on<ChangePriceRange>(_onChangePriceRange);
    on<ApplyFilters>(_onApplyFilters);
  }
  void _onToggleOutOfStock(ToggleOutOfStock event, Emitter<FilterState> emit) {
    emit(state.copyWith(isOutOfStock: event.isChecked));
  }
  void _onChangeCategory(ChangeCategory event, Emitter<FilterState> emit) {
    emit(state.copyWith(category: event.category));
  }
  void _onChangePriceRange(ChangePriceRange event, Emitter<FilterState> emit) {
    emit(state.copyWith(priceRange: event.range));
  }
  void _onApplyFilters(ApplyFilters event, Emitter<FilterState> emit) {
    // Process the filters here, e.g., make a network request or update other states
    // For example:
    _fetchFilteredData(event.isOutOfStock, event.category, event.priceRange);
  }

  void _fetchFilteredData(bool isOutOfStock, String category, RangeValues priceRange) {
    // Implement your network request logic here
    print('Fetching data with filters:');
    print('Out of Stock: $isOutOfStock');
    print('Category: $category');
    print('Price Range: ${priceRange.start} - ${priceRange.end}');
    // You can also emit a new state if needed
  }
}


