import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'vigitable_event.dart';
part 'vigitable_state.dart';

class VegetableBloc extends Bloc<VegetableEvent, VegetableState> {
  VegetableBloc() : super(VegetableInitial()) {
    on<FetchVegetables>(_onFetchVegetables);
  }

  Future<void> _onFetchVegetables(
      FetchVegetables event,
      Emitter<VegetableState> emit,
      ) async {
    emit(VegetableLoading());
    try {
      final response = await http.get(
        Uri.parse('https://sahyadribackend.profcymabackend.com/public/api/vegitable'),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedJson = json.decode(response.body);
        final vegetables = (decodedJson['data'] as List)
            .map((item) => {"id": item['id'], "name": item['name']})
            .toList();
        emit(VegetableLoaded(vegetables));
      } else {
        emit(VegetableError('Failed to load vegetables'));
      }
    } catch (e) {
      emit(VegetableError('An error occurred: $e'));
    }
  }
}