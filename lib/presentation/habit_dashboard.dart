import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push/model/ItemModel.dart';
import 'package:push/utils/text_styles.dart';

import '../bloc/habit/item_bloc.dart';
import '../bloc/habit/item_state.dart';
import '../painter/RoundedRectangleClipper.dart';
import 'component/DateCard.dart';
import 'component/selected_card.dart';

class CalendarView extends StatefulWidget {
  const CalendarView({super.key});

  @override
  _CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // Generate a list of dates for the current month
    final firstDayOfMonth =
        DateTime(DateTime.now().year, DateTime.now().month, 1);
    final lastDayOfMonth =
        DateTime(DateTime.now().year, DateTime.now().month + 1, 0);

    final dates = <DateTime>[];
    for (var date = firstDayOfMonth;
        date.isBefore(lastDayOfMonth.add(Duration(days: 1)));
        date = date.add(Duration(days: 1))) {
      dates.add(date);
    }
    int? _selectedItemId;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                Text("Habit Dashboard",style: TextStyles.heading1Accent,),
                const SizedBox(height: 20,),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dates.length,
                    itemBuilder: (context, index) {
                      final date = dates[index];
                      return DateCard(
                        date: date,
                        isSelected: _selectedDate == date,
                        onTap: () {
                          setState(() {
                            _selectedDate = date;
                            print(_selectedDate);
                          });
                        },
                      );
                    },
                  ),
                ),
              const SizedBox(height: 30,),
              ClipPath(
                clipper: RoundedRectangleClipper(borderRadius: 12
               
                ),
                child: Container(
                  height: MediaQuery.of(context).size.width*.45,
                  child: BlocBuilder<ItemBloc, ItemState>(
                  builder: (context, state) {
                    if (state is ItemLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ItemLoaded) {
                      final items = state.items;
                   /*  _selectedItemId = items.first.id;
                     items.first.isSelected = true; // Set the first item as selected*/

                      return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        padding: const EdgeInsets.all(8),
                        itemCount: items.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final item = items[index];


                          return SelectableCard(
                            item: item,


                            onTap: () {
                              setState(() {
                                // Deselect all items
                                items.forEach((i) => i.isSelected = false);
                                // Select the tapped item
                                item.isSelected = true;
                                print('Selected Item: ${item.name}');
                              });
                            },
                          );
                        },
                      );
                    } else if (state is ItemError) {
                      return Center(child: Text(state.message));
                    } else {
                      return Center(child: Text('No data available'));
                    }
                  },
            ),
                ),
              ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
