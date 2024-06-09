import 'dart:async';
import 'todo.dart';
import 'utils.dart';

abstract class TodoRepo {
  const TodoRepo();

  Future<List<Todo>> getAll();
  Future<void> addTodo(Todo todo);

  Future<void> removeTodo(String id);
}

class FakeTodoRepo implements TodoRepo {
  final List<Todo> _todos = [];

  Future<List<Todo>> getAll() async => [..._todos];

  Future<void> addTodo(Todo todo) async {
    _todos.add(todo.copyWith(id: generateId().toString()));
  }

  Future<void> removeTodo(String id) async {
    _todos.removeWhere((item) => item.id == id);
  }
}
