import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../model/ItemModel.dart';
import 'item_state.dart';
import 'package:http/http.dart' as http;
part 'item_event.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc() : super(ItemInitial()) {
    on<FetchItems>(_onFetchItems);
    on<ToggleItemSelection>(_onToggleItemSelection);
  }

  Future<void> _onFetchItems(FetchItems event, Emitter<ItemState> emit) async {
    emit(ItemLoading());
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final items = data.map((json) => ItemModel.fromJson(json)).toList();
        emit(ItemLoaded(items));
      } else {
        emit(ItemError('Failed to load items'));
      }
    } catch (e) {
      emit(ItemError(e.toString()));
    }
  }

  void _onToggleItemSelection(
      ToggleItemSelection event,
      Emitter<ItemState> emit,
      ) {
    if (state is ItemLoaded) {
      final currentState = state as ItemLoaded;
      final items = currentState.items.map((item) {
        if (item.id == event.itemId) {
          item.toggleSelection();
        }
        return item;
      }).toList();
      emit(ItemLoaded(items));
    }
  }
}