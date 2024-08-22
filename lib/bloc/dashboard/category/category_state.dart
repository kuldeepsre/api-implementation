part of 'category_bloc.dart';


abstract class CategoryState extends Equatable {
  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoryState {}

class CategoriesLoading extends CategoryState {}

class CategoriesLoaded extends CategoryState {
  final List<Category> categories;
  final Category? selectedCategory;

  CategoriesLoaded({required this.categories, this.selectedCategory});

  @override
  List<Object> get props => [categories, selectedCategory ?? ''];
}

class CategoriesError extends CategoryState {
  final String message;

  CategoriesError(this.message);

  @override
  List<Object> get props => [message];
}