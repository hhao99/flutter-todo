import 'dart:collection';

import 'package:flutter/material.dart';

class Todo {
    String task;
    bool isDone = false;
    Todo(this.task);
}

class TodosModel extends ChangeNotifier {
    final List<Todo> _todos = [];

    TodosModel();

    UnmodifiableListView<Todo> get todos => UnmodifiableListView(_todos);

    add(Todo todo) {
        _todos.add(todo);
        notifyListeners();
    }
    remove(Todo todo) {
        _todos.remove(todo);
        notifyListeners();
    }
    update(Todo todo) {
        _todos[_todos.indexOf(todo)].isDone = todo.isDone;
        notifyListeners();
    }
    
}