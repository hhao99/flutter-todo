import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo/todo/todo.dart';

class TodoHomePage extends StatelessWidget {
  const TodoHomePage({super.key});

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
        body: const TodoView(),
        floatingActionButton: ElevatedButton(
            onPressed: () {
              print('add new task');
              Navigator.pushNamed(context, '/add');
            },
            child: Text("Add new task...")),
      ),
    );
  }
}
