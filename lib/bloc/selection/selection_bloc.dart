import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../model/Option.dart';

part 'selection_event.dart';
part 'selection_state.dart';

// Define your BLoC
class CheckboxPopupBloc extends Bloc<CheckboxPopupEvent, CheckboxPopupState> {
  CheckboxPopupBloc(List<Option> options)
      : super(CheckboxPopupState(
    selections: List.generate(options.length, (_) => false),
    options: options,
  )) {
    on<ToggleCheckbox>(_onToggleCheckbox);
    on<ApplySelections>(_onApplySelections);
  }

  // Handler for ToggleCheckbox event
  void _onToggleCheckbox(ToggleCheckbox event, Emitter<CheckboxPopupState> emit) {
    final newSelections = List<bool>.from(state.selections);
    newSelections[event.index] = event.isChecked;
    emit(state.copyWith(selections: newSelections));
  }

  // Handler for ApplySelections event
  void _onApplySelections(ApplySelections event, Emitter<CheckboxPopupState> emit) {
    // Manually filter the options based on the selections
    final selectedOptions = <Option>[];

    for (int i = 0; i < state.options.length; i++) {
      if (state.selections[i]) {
        selectedOptions.add(state.options[i]);
      }
    }
    // Handle apply action (e.g., print selected options)
    print('Selected options: ${selectedOptions.map((option) => option.id).toList()}');
    /* // Prepare the data for API call
    final selectedOptionIds = selectedOptions.map((option) => option.id).toList();

    // Replace with your API endpoint
    final apiUrl = 'https://example.com/api/apply-selections';
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({'selected_option_ids': selectedOptionIds}),
    );

    if (response.statusCode == 200) {
      // Handle success
      print('Selections applied successfully');
    } else {
      // Handle error
      print('Failed to apply selections');
    }
  }*/
  }
}
