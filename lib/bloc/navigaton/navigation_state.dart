part of 'navigation_bloc.dart';


abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class NavigationInitial extends NavigationState {}

class NavigationUpdated extends NavigationState {
  final int index;

  const NavigationUpdated({required this.index});

  @override
  List<Object> get props => [index];
}