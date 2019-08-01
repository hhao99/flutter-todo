import 'dart:collection';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Todo {
  String task;
  bool done = false;

  Todo(this.task,[this.done=false]);

}

enum ShowType { all, todo, done }

class TodoModel with ChangeNotifier {
  List<Todo> _todos = [];
  ShowType _type = ShowType.all;

  TodoModel(this._todos);

  List<Todo> get todos => _filteredTodos();

  _filteredTodos() {
    switch(_type) {
      case ShowType.all:
        return _todos.toList();
        break;
      case ShowType.todo:
        return _todos.where( (todo) => !todo.done).toList();
        break;
      case ShowType.done:
        return _todos.where( (todo) => todo.done).toList();
        break;
    }
  }

  add(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }
  update(int index) {
    _todos[index].done = !_todos[index].done;
    notifyListeners();
  }
  remove(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }
  updateType(ShowType type) {
    _type = type;
    notifyListeners();
  }
}