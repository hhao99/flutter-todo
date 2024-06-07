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
    if (index > -1) {
      print('found $index');
      _items.removeWhere((item) => item.id == todo.id);
      // if (index == 0) {
      //   _items.clear();
      // }
      notifyListeners();
    }
  }

  void toggle(Todo todo) {
    final index = _items.indexWhere((item) => item.id == todo.id);
    if (index > -1) {
      _items[index].done = !_items[index].done;
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
  bool done;
  Todo({required this.id, required this.task, this.done = false});

  @override
  String toString() => 'Todo: { task: $task, id: $id, done: $done}';
}
