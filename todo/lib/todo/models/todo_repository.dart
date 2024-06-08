import 'dart:async';
import 'package:todo_app/todo/models/todo.dart';

abstract class TodoRepository {
  const TodoRepository();

  List<Todo> load();
}

class FakeTodoRepository implements TodoRepository {
  List<Todo> load() {
    return [
      const Todo(id: 'fake_1', task: 'first task'),
      const Todo(id: 'fake_2', task: 'second task'),
      const Todo(id: 'fake_3', task: 'third task')
    ];
  }
}
