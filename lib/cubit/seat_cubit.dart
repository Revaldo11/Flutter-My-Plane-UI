import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class SeatCubit extends Cubit<List<String>> {
  SeatCubit() : super([]);

  void addSeat(String id) {
    if (!state.contains(id)) {
      debugPrint('add $id');
      emit([...state, id]);
    } else {
      debugPrint('remove $id');
      emit(state.where((element) => element != id).toList());
    }
  }

  void clearSeat() {
    emit([]);
  }
}
