import 'package:flutter/material.dart';
import 'package:todo_app/theme.dart';

class TodoApp extends MaterialApp {
  const TodoApp({super.key})
      : super(home: const AppView(title: 'Flutter Bloc Todo Demo'));
}

class AppView extends StatelessWidget {
  const AppView({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            colorScheme: TodoAppTheme.light.colorScheme, useMaterial3: true),
        home: const MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter BLOC Todo Demo")),
      body: Center(
        child: Column(children: [
          Text("Fluter Todo Demo"),
        ]),
      ),
    );
  }
}
