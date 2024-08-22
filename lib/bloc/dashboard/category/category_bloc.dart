import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../../../model/Category.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoriesInitial()) {
    on<LoadCategories>(_onLoadCategories);
    on<SelectCategory>(_onSelectCategory);
  }

  Future<void> _onLoadCategories(
      LoadCategories event,
      Emitter<CategoryState> emit,
      ) async {
    emit(CategoriesLoading());
    try {
      // Load the JSON file
      final jsonString = await rootBundle.loadString('assets/categories.json');
      // Decode the JSON data
      final List<dynamic> jsonResponse = json.decode(jsonString);
      // Convert to a list of Category objects
      List<Category> categories = jsonResponse
          .map((data) => Category.fromJson(data as Map<String, dynamic>))
          .toList();

      emit(CategoriesLoaded(categories: categories));
    } catch (e) {
      emit(CategoriesError('Failed to load categories: $e'));
    }
  }

  void _onSelectCategory(
      SelectCategory event,
      Emitter<CategoryState> emit,
      ) {
    if (state is CategoriesLoaded) {
      final currentState = state as CategoriesLoaded;
      emit(CategoriesLoaded(
        categories: currentState.categories,
        selectedCategory: event.category,
      ));
    }
  }
}