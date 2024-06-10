import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/todo/todo.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TodoBloc>();
    return BlocConsumer<TodoBloc, TodosState>(
      bloc: bloc,
      listener: (blocContext, state) {},
      builder: (context, state) {
        if (state is TodosLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TodosLoaded) {
          final todos = state.todos;
          return _buildTodoList(todos, bloc);
        } else {
          return Center(child: Text("Something went wrong"));
        }
      },
    );
  }

  _buildTodoList(List<Todo> todos, TodoBloc bloc) {
    if (todos.isEmpty)
      return Text("No task to list now!");
    else {
      return ListView.builder(
          padding: EdgeInsets.all(8.0),
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final todo = todos[index];
            return ListTile(
              key: ValueKey(todo.id),
              title: Text(todo.task),
              leading: CircleAvatar(
                  child: Icon(
                      todo.completed ? Icons.toggle_on : Icons.toggle_off)),
              trailing: ElevatedButton(
                  child: Icon(Icons.delete),
                  onPressed: () {
                    bloc.add(RemoveTodo(id: todo.id));
                  }),
            );
          });
    }
  }

  buildListView(List<Todo> todos) {
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) => ListTile(
              title: Text(todos[index].task),
              subtitle: Text(todos[index].toString()),
              leading: Checkbox(
                  onChanged: (value) {},
                  activeColor: Colors.amber,
                  value: todos[index].completed),
            ));
  }
}
