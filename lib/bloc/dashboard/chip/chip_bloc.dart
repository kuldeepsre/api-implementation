import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/ChipItem.dart';
part 'chip_event.dart';
part 'chip_state.dart';


class ChipBloc extends Bloc<ChipEvent, ChipState> {
  ChipBloc() : super(ChipInitial()) {
    on<LoadChips>(_onLoadChips);
    on<ToggleChipSelection>(_onToggleChipSelection);
  }

/*  // Function to handle loading chips from a JSON file
  void _onLoadChips(LoadChips event, Emitter<ChipState> emit) async {
    emit(ChipLoading());
    try {
      final String response = await rootBundle.loadString('assets/chips.json');
      final List<dynamic> data = json.decode(response);
      List<ChipItem> chips = data.map((chip) => ChipItem.fromJson(chip)).toList();
      emit(ChipLoaded(chips));
    } catch (e) {
      emit(ChipInitial());
      // Optionally handle errors here
    }
  }

  // Function to handle toggling chip selection
  void _onToggleChipSelection(
      ToggleChipSelection event, Emitter<ChipState> emit) {
    if (state is ChipLoaded) {
      final currentState = state as ChipLoaded;
      final chips = currentState.chips.map((chip) {
        if (chip.id == event.chipId) {
          return ChipItem(
              id: chip.id, name: chip.name, isSelected: !chip.isSelected);
        }
        return chip;
      }).toList();

      emit(ChipLoaded(chips));
    }
  }*/
  void _onLoadChips(LoadChips event, Emitter<ChipState> emit) async {
    emit(ChipLoading());
    try {
      // Load the JSON file as a string
      final String response = await rootBundle.loadString('assets/chips.json');
      // Parse the JSON string into a list of dynamic objects
      final List<dynamic> data = json.decode(response);

      // Convert the list of dynamic objects into a list of ChipItem instances
      List<ChipItem> chips = data.map((chip) => ChipItem.fromJson(chip)).toList();

      int? defaultSelectedId;

      // Select the first chip by default and capture its ID
      if (chips.isNotEmpty) {
        chips[0].isSelected = true;
        defaultSelectedId = chips[0].id;
      }

      emit(ChipLoaded(chips, defaultSelectedId: defaultSelectedId));
    } catch (e) {
      emit(ChipInitial());
      // Optionally handle errors here
    }
  }

  void _onToggleChipSelection(
      ToggleChipSelection event, Emitter<ChipState> emit) {
    if (state is ChipLoaded) {
      final currentState = state as ChipLoaded;

      // Toggle selection logic to enforce single selection
      List<ChipItem> updatedChips = currentState.chips.map((chip) {
        // Deselect all chips except the selected one
        if (chip.id == event.chipId) {
          return ChipItem(
            id: chip.id,
            name: chip.name,
            isSelected: !chip.isSelected,
          );
        } else {
          return ChipItem(
            id: chip.id,
            name: chip.name,
            isSelected: false, // Deselect all other chips
          );
        }
      }).toList();

      emit(ChipLoaded(updatedChips, defaultSelectedId: event.chipId));
    }
  }
}
