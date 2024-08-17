import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/selection/selection_bloc.dart';
import '../model/Option.dart';
 // Import your BLoC

class CheckboxPopupDialog extends StatelessWidget {
  final List<Option> options;

  CheckboxPopupDialog({required this.options});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CheckboxPopupBloc(options),
      child: BlocBuilder<CheckboxPopupBloc, CheckboxPopupState>(
        builder: (context, state) {
          return AlertDialog(
            title: Text('Select Options'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: List.generate(state.options.length, (index) {
                  return CheckboxListTile(
                    title: Text(state.options[index].name),
                    value: state.selections[index],
                    onChanged: (bool? isChecked) {
                      context.read<CheckboxPopupBloc>().add(
                        ToggleCheckbox(index, isChecked ?? false),
                      );
                    },
                  );
                }),
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CheckboxPopupBloc>().add(ApplySelections());
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('Apply'),
              ),
            ],
          );
        },
      ),
    );
  }
}
