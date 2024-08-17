part of 'selection_bloc.dart';



// Define your events
abstract class CheckboxPopupEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ToggleCheckbox extends CheckboxPopupEvent {
  final int index;
  final bool isChecked;

  ToggleCheckbox(this.index, this.isChecked);

  @override
  List<Object> get props => [index, isChecked];
}

class ApplySelections extends CheckboxPopupEvent {}
