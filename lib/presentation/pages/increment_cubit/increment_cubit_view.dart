import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'increment_cubit_cubit.dart';
import 'increment_cubit_state.dart';

class IncrementCubitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => IncrementCubitCubit(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final cubit = BlocProvider.of<IncrementCubitCubit>(context);
    cubit.getTodos();
    return Scaffold(
      appBar: AppBar(
        title: const Text('IncrementCubit'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<IncrementCubitCubit, IncrementCubitState>(
              builder: (context, state) {
                return Center(
                  child: Text(
                    'Counter: ${state.counter}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: cubit.increment,
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: cubit.decrement,
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
            BlocBuilder<IncrementCubitCubit, IncrementCubitState>(
                builder: (context, state) {
              return Switch(
                  value: cubit.state.isSwitched,
                  onChanged: (value) {
                    cubit.switchOnOff();
                  });
            }),
            BlocBuilder<IncrementCubitCubit, IncrementCubitState>(
                builder: (context, state) {
                  debugPrint("state.todos.length: ${state.myListTodo.length}");
              return Column(
                children: List.generate(
                  state.myListTodo.length,
                  (index) => ListTile(
                    title: Text(state.myListTodo[index].title ?? ""),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
