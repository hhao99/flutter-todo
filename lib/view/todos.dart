import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';


import '../app.dart';
import '../model/todos.dart';

class TodosView extends StatefulWidget {
  final String title;


  TodosView({this.title});

  State<StatefulWidget> createState() => _TodosState();

}

class _TodosState extends State<TodosView> {
  @override 
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text("todos demo")),
      body:Column(
      children: <Widget>[
       MyContainer(
          height: 120,
          child: Text(
              "Total task need to done: ",
              style: Theme.of(context).textTheme.headline
          )
        ),
        MyContainer(
            height: 480,
            child: Consumer<TodosModel>(

              builder: (context,model,child) {
                return  ListView.builder(
                    itemCount: model.todos.length,
                    itemBuilder: (context, index) {
                      final todo = model.todos[index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text( todo.task,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: todo.isDone?Colors.red: Colors.teal,

                          )
                          ),
                      FlatButton(
                      onPressed: () {
                      _toggleTodoIsDone(context, todo);
                      },
                      child: Icon(Icons.update)
                      ),

                      FlatButton(
                            onPressed: () {
                              _removeTodo(context, todo);
                            },
                            child: Icon(Icons.remove)
                          ),

                        ],
                      );

                    }
                );
              }
            )

        ),


      ],
    ),
      floatingActionButton: FloatingActionButton(
        tooltip: "add new task",
        child: Icon(Icons.add),
        onPressed: () {
          _addTodo(context);
        },
      ),

    ); 
    

  }

  _addTodo(context) {
    final model = Provider.of<TodosModel>(context, listen: false);
    final todo = Todo("task ${model.todos.length}");
    model.add(todo);
  }
  _removeTodo(context,todo) {
    final model = Provider.of<TodosModel>(context, listen:false);
    model.remove(todo);
  }
  _toggleTodoIsDone(context,todo) {
    final model = Provider.of<TodosModel>(context, listen:false);
    todo.isDone = !todo.isDone;
    model.update(todo);
  }

  
}