part of 'selection_bloc.dart';


class CheckboxPopupState extends Equatable {
  final List<bool> selections;
  final List<Option> options;

  CheckboxPopupState({required this.selections, required this.options});

  CheckboxPopupState copyWith({List<bool>? selections}) {
    return CheckboxPopupState(
      selections: selections ?? this.selections,
      options: options,
    );
  }

  @override
  List<Object> get props => [selections, options];
}
