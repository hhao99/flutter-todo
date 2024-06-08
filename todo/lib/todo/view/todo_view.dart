import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/todo/todo.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BLOC todo demo"),
      ),
      body: Container(
        child: BlocBuilder<TodoCubit, TodoState>(builder: (context, state) {
          return Text(state.toString());
        }),
      ),
    );
  }
}
