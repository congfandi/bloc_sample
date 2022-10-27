import 'package:bloc_sample/data/model/todo/todo.dart';
import 'package:bloc_sample/domain/repository/sample_url.dart';

class IncrementCubitState {
  int? counter = 0;
  bool isSwitched = false;
  final SampleRequest sampleRequest = SampleRequest();
  List<Todo> myListTodo = [];

  IncrementCubitState init() {
    return IncrementCubitState();
  }

  IncrementCubitState clone() {
    return IncrementCubitState();
  }
}
