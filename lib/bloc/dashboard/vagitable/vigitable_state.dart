part of 'vigitable_bloc.dart';

// vegetable_state.dart
abstract class VegetableState {}

class VegetableInitial extends VegetableState {}

class VegetableLoading extends VegetableState {}

class VegetableLoaded extends VegetableState {
  final List<Map<String, dynamic>> vegetables;
  VegetableLoaded(this.vegetables);
}

class VegetableError extends VegetableState {
  final String message;
  VegetableError(this.message);
}