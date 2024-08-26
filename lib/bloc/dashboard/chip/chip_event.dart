part of 'chip_bloc.dart';

abstract class ChipEvent {}

class LoadChips extends ChipEvent {}

class ToggleChipSelection extends ChipEvent {
  final int chipId;

  ToggleChipSelection(this.chipId);
}