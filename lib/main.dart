import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:to2/model/todo.dart';
import 'package:to2/pages/todolist.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;

  List<Todo> todos = []
    ..add(Todo('1st task',false))
    ..add(Todo('2nd task',true));

  runApp(ChangeNotifierProvider<TodoModel>(
    builder: (context)=> TodoModel(todos),
    child:
      MyApp()

  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Todo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
        TodoListPage(),
      floatingActionButton: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          //todo add add logic
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("add new task"),
                content: TextField(

                  onSubmitted: (event) {
                    var todo = Todo(event);
                    TodoModel model = Provider.of<TodoModel>(context);
                    model.add(todo);
                    Navigator.pop(context);
                  },
                )

              );
            }
          );

        },
      )
    );

  }
}
