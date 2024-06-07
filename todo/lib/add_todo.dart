import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo.dart';
import 'package:uuid/uuid.dart';

class AddTodoForm extends StatefulWidget {
  const AddTodoForm({super.key});

  @override
  State<StatefulWidget> createState() => _AddTodoFormState();
}

class _AddTodoFormState extends State<AddTodoForm> {
  final taskController = TextEditingController();

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    var todos = context.watch<TodoModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todo Form"),
      ),
      body: Column(
        children: [
          Row(
            children: [Center(child: Text("Add new task Form"))],
          ),
          Row(
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                    controller: taskController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "what's the task")),
              )
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                child: Text("add..."),
                onPressed: () {
                  todos.add(Todo(taskController.text, Uuid().v4()));
                  print(todos.items);
                  Navigator.pop(context);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
