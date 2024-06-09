import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/todo/todo.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    buildListView(List<Todo> todos) {
      print(todos);
      return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) => ListTile(
                title: Text(todos[index].task),
                subtitle: Text(todos[index].toString()),
                leading: CircleAvatar(child: Text(todos[index].task[0])),
              ));
    }

    return BlocBuilder<TodoBloc, TodosState>(
      builder: (context, state) {
        if (state is TodosLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TodosLoaded) {
          return Container(child: buildListView(state.todos));
        } else {
          return Center(child: Text("Something went wrong"));
        }
      },
    );
  }
}
