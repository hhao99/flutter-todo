import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo/todo/todo.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc()
        ..add(LoadTodos(todos: [
          Todo(id: generateId(), task: "first task"),
          Todo(id: generateId(), task: 'second task'),
          Todo(id: generateId(), task: 'third task'),
        ])),
      child: Scaffold(
          appBar: AppBar(title: Text("Bloc Todo Demo")),
          body: const TodoView()),
    );
  }
}
