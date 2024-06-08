import 'package:flutter/material.dart';
import 'package:todo_app/counter/counter.dart';
import 'package:todo_app/todo/todo.dart';

class CounterApp extends MaterialApp {
  const CounterApp({super.key}) : super(home: const CounterPage());
}

class TodoApp extends MaterialApp {
  const TodoApp({super.key}) : super(home: const TodoPage());
}
