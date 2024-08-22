part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadCategories extends CategoryEvent {}
class SelectCategory extends CategoryEvent {
  final Category category;

  SelectCategory(this.category);

  @override
  List<Object> get props => [category];
}


