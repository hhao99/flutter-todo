import 'package:flutter/material.dart';
import 'package:todo/todo/todo.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BLOC example",
      initialRoute: "/",
      routes: {"/": (_) => TodoHomePage(), "/add": (_) => TodoAddView()},
    );
  }
}
