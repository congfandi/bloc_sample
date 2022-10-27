import 'package:bloc/bloc.dart';
import 'package:bloc_sample/data/model/todo/todo.dart';
import 'package:flutter/cupertino.dart';

import 'increment_cubit_state.dart';

class IncrementCubitCubit extends Cubit<IncrementCubitState> {
  IncrementCubitCubit() : super(IncrementCubitState().init());

  void getTodos() async {
    List<dynamic> response = await state.sampleRequest.getSampleJson();
    for (var element in response) {
      emit(state.clone()..myListTodo.add(Todo.fromJson(element)));
    }
  }

  void increment() {
    emit(state.clone()..counter = state.counter! + 1);
  }

  void decrement() {
    emit(state.clone()..counter = state.counter! - 1);
  }

  void switchOnOff() {
    emit(state.clone()..isSwitched = !state.isSwitched);
  }
}
