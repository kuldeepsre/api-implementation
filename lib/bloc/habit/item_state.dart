import 'package:equatable/equatable.dart';
import '../../model/ItemModel.dart';


abstract class ItemState extends Equatable {
  @override
  List<Object> get props => [];
}

class ItemInitial extends ItemState {}

class ItemLoading extends ItemState {}

class ItemLoaded extends ItemState {
  final List<ItemModel> items;
  final int? selectedItemId;

  ItemLoaded(this.items, {this.selectedItemId});

  @override
  List<Object> get props => [items, selectedItemId ?? 0]; // Handle nullable selectedItemId` appropriately
}

class ItemError extends ItemState {
  final String message;

  ItemError(this.message);

  @override
  List<Object> get props => [message];
}