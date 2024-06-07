import 'package:flutter/material.dart';

class TodoModel extends ChangeNotifier {
  final List<Todo> _items = [];

  List<Todo> get items => this._items;

  void add(Todo todo) {
    _items.add(todo);
    notifyListeners();
  }

  void remove(Todo todo) {
    final index = items.indexWhere((item) => item.id == todo.id);
    if (index > 0) {
      print('found $index');
      _items.removeWhere((item) => item.id == todo.id);
      notifyListeners();
    }
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}

class Todo {
  final String id;
  final String task;
  final bool done;

  Todo(this.task, this.id, {this.done = false});

  @override
  String toString() => 'Todo: { task: $task, id: $id, done: $done}';
}
