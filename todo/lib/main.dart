import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/add_todo.dart';

void main() {
  var model = TodoModel();
  runApp(
    ChangeNotifierProvider(
      create: (context) => model,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "Flutter Todo Demo"),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  Widget build(BuildContext context) {
    var todos = context.watch<TodoModel>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: todos.items.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(todos.items[index].task,
                  style: TextStyle(
                    decoration: todos.items[index].done
                        ? TextDecoration.lineThrough
                        : null,
                  )),
              subtitle: Text(todos.items[index].toString()),
              leading: CircleAvatar(
                child: Text(todos.items[index].task[0]),
              ),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      todos.remove(todos.items[index]);
                    }),
                IconButton(
                    icon: Icon(
                      todos.items[index].done
                          ? Icons.toggle_on
                          : Icons.toggle_off,
                    ),
                    onPressed: () {
                      todos.toggle(todos.items[index]);
                    })
              ]));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddTodoForm()))
        },
        tooltip: 'add new todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TodoItem extends StatelessWidget {
  final Todo todo;
  const TodoItem(@required this.todo, {key});

  Widget build(BuildContext context) {
    var todos = context.watch<TodoModel>();
    return InkWell(
        child: ListTile(
          leading: CircleAvatar(
              backgroundColor: Colors.amber, child: Text(todo.task[0])),
          title: Text(
            todo.task,
            textAlign: todo.done ? TextAlign.left : TextAlign.end,
          ),
        ),
        onDoubleTap: () {
          todos.remove(todo);
        },
        onTap: () {
          todos.toggle(todo);
        });
  }
}
