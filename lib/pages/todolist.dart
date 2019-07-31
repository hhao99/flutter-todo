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