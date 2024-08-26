part of 'item_bloc.dart';
abstract class ItemEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchItems extends ItemEvent {}
class ToggleItemSelection extends ItemEvent {
  final int itemId; // ID of the item to toggle selection

  ToggleItemSelection(this.itemId);
}