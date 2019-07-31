import 'dart:collection';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Todo {
  String task;
  bool done = false;

  Todo(this.task,[this.done=false]);

}

class TodoModel with ChangeNotifier {
  List<Todo> _todos = [];

  TodoModel(this._todos);

  List<Todo> get todos => this._todos;

  add(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }
}