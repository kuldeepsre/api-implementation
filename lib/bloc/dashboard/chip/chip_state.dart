part of 'chip_bloc.dart';

abstract class ChipState {}

class ChipInitial extends ChipState {}

class ChipLoading extends ChipState {}
class ChipLoaded extends ChipState {
  final List<ChipItem> chips;
  final int? defaultSelectedId;

  ChipLoaded(this.chips, {this.defaultSelectedId});
}