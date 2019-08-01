v0

📄 README.md
```md
# to2

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



# provider state management 
in the flutter, some state management framework introduced by rewrite the mature package to support thsi function, like redux, fish-dux, and bloc design pattern more native to flutter, provider was developed by google, and more simple and seamless integrated with flutter.

now we add package dependency in the pubsec.yaml file.

📄 pubspec.yaml
```diff
  dependencies:
    flutter:
      sdk: flutter
+   provider: ^3.0.0+1
  
  

# Add todo model

the Todo model need extends from ChangeNotifier, and with any data update, we must notify the listens who are interested our data with notifyListeners();

📄 lib/model/todo.dart
```dart
import 'dart:collection';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Todo {
  String task;
  bool done = false;
  Todo(this.task,{this.done = false});

}

class TodoModel with ChangeNotifier {
  List<Todo> _todos = [];

  TodoModel(this._todos);

  UnmodifiableListView<Todo> get todos => this._todos;

  add(Todo todo) {
    _todos.add(todo);
  }
}


# consume the data in the view layer

now add the Todolist page 
Provider provide the convienient way to retrieve the data with 
Provider.of<TodoModel>(context) to get the reference to our state data.

```
📄 lib/pages/todolist.dart
```dart
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:to2/model/todo.dart';

class TodoListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    UnmodifiableListView<Todo> todos = Provider.of<TodoModel>(context).todos;
    return Center(
      child: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context,index) {
          return Container(
            decoration: BoxDecoration(color: todos[index].done?Colors.green:Colors.amber),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Checkbox(
                  value: todos[index].done,
                  onChanged: (e) {

                  },

                ),
                Text(todos[index].task),
              ],
            )
          )
        },

      ),
    );
  }
}
```

# pass the data down, lifting the state up
now we add the Provider model on the top of the all widget.

📄 lib/main.dart
```diff
  import 'package:flutter/material.dart';
+ import 'package:provider/provider.dart';
  
- void main() => runApp(MyApp());
+ import 'package:to2/model/todo.dart';
+ import 'package:to2/pages/todolist.dart';
+ 
+ void main() {
+   Provider.debugCheckInvalidValueType = null;
+ 
+   List<Todo> todos = []
+     ..add(Todo('1st task',false))
+     ..add(Todo('2nd task',true));
+ 
+   runApp(ChangeNotifierProvider<TodoModel>(
+     builder: (context)=> TodoModel(todos),
+     child:
+       MyApp()
+ 
+   ));
+ }
  
  class MyApp extends StatelessWidget {
    // This widget is the root of your application.
        theme: ThemeData(
            primarySwatch: Colors.blue,
        ),
-       home: MyHomePage(title: 'Flutter Demo Home Page'),
+       home: MyHomePage(title: 'Todo App'),
      );
    }
  }
        appBar: AppBar(
          title: Text(widget.title),
        ),
-       body: Center(
-         // Center is a layout widget. It takes a single child and positions it
-         // in the middle of the parent.
-         child: Column(
- 
-           mainAxisAlignment: MainAxisAlignment.center,
-           children: <Widget>[
-             Text(
-               'start from here',
-             ),
- 
-           ],
-         ),
-       ),
+       body:
+         TodoListPage()
      );
    }
  }

we add the optional constructor parameter in the Todo class.
```
📄 lib/model/todo.dart
```diff
  class Todo {
    String task;
    bool done = false;
-   Todo(this.task,{this.done = false});
+ 
+   Todo(this.task,[this.done=false]);
  
  }
  
  
    TodoModel(this._todos);
  
-   UnmodifiableListView<Todo> get todos => this._todos;
+   List<Todo> get todos => this._todos;
  
    add(Todo todo) {
      _todos.add(todo);
+     notifyListeners();
    }
  }
```
📄 lib/pages/todolist.dart
```diff
  
    @override
    Widget build(BuildContext context) {
-     UnmodifiableListView<Todo> todos = Provider.of<TodoModel>(context).todos;
+     List<Todo> todos = Provider.of<TodoModel>(context).todos;
      return Center(
        child: ListView.builder(
          itemCount: todos.length,
                  Text(todos[index].task),
                ],
              )
-           )
+           );
          },
  
        ),

# add floating button for the add new todo

📄 lib/main.dart
```diff
          title: Text(widget.title),
        ),
        body:
-         TodoListPage()
+         TodoListPage(),
+       floatingActionButton: IconButton(
+         icon: Icon(Icons.add),
+         onPressed: () {
+           //todo add add logic
+           showDialog(
+             context: context,
+             builder: (context) {
+               return AlertDialog(
+                 title: Text("add new task"),
+                 content: TextField(
+                   onSubmitted: (event) {
+                     var todo = Todo(event);
+                     TodoModel model = Provider.of<TodoModel>(context);
+                     model.add(todo);
+                     Navigator.pop(context);
+                   },
+                 )
+ 
+               );
+             }
+           );
+ 
+         },
+       )
      );
+ 
    }
  }

