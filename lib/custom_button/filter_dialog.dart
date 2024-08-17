import 'package:flutter/material.dart';

// Define a custom Filter Dialog widget
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/filter_bloc/filter_bloc.dart';


class FilterDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Filter Options'),
      content: SingleChildScrollView(
        child: BlocBuilder<FilterBloc, FilterState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Checkbox filter
                CheckboxListTile(
                  title: Text('Include Out of Stock'),
                  value: state.isOutOfStock,
                  onChanged: (bool? value) {
                    context.read<FilterBloc>().add(ToggleOutOfStock(value ?? false));
                  },
                ),
                SizedBox(height: 10.0),

                // Dropdown filter
                Text('Category'),
                DropdownButton<String>(
                  value: state.category,
                  onChanged: (String? newValue) {
                    context.read<FilterBloc>().add(ChangeCategory(newValue!));
                  },
                  items: <String>['All', 'Electronics', 'Fashion', 'Home', 'Books']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 10.0),

                // Range Slider filter
                Text('Price Range'),
                RangeSlider(
                  values: state.priceRange,
                  min: 0,
                  max: 1000,
                  divisions: 10,
                  overlayColor: MaterialStateProperty.all(Colors.green),
                  labels: RangeLabels(
                    '\$${state.priceRange.start.toStringAsFixed(0)}',
                    '\$${state.priceRange.end.toStringAsFixed(0)}',
                  ),
                  onChanged: (RangeValues values) {
                    context.read<FilterBloc>().add(ChangePriceRange(values));
                  },
                ),
              ],
            );
          },
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Dismiss the dialog
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final filterState = context.read<FilterBloc>().state;

            // Dispatch the ApplyFilters event
            context.read<FilterBloc>().add(
              ApplyFilters(
                isOutOfStock: filterState.isOutOfStock,
                category: filterState.category,
                priceRange: filterState.priceRange,
              ),
            );
            Navigator.of(context).pop(); // Dismiss the dialog
          },
          child: Text('Apply'),
        ),
      ],
    );
  }
}


