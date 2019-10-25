import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to2/model/todo.dart';

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TodoModel model = Provider.of<TodoModel>(context);
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
              child: Text("ALL"),
              onPressed: ()=> model.updateType(ShowType.all),
              ),
              FlatButton(
                child: Text("Todo"),
                onPressed: ()=> model.updateType(ShowType.todo),
              ),
              FlatButton(
                child: Text("DONE"),
                onPressed: ()=> model.updateType(ShowType.done),
              ),
        ],
      ),
          Expanded(
          child:  ListView.builder(
              itemCount: model.todos.length,
              itemBuilder: (context,index) {
                return Container(
                    decoration: BoxDecoration(color: model.todos[index].done?Colors.green:Colors.amber),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Checkbox(
                          value: model.todos[index].done,
                          onChanged: (e) {
                            model.update(index);
                          },
                        ),
                        Text(model.todos[index].task),

                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: (){
                            model.remove(index);
                          },
                        )
                      ],
                    )

                );
              }),
      ),

    ]),
    );
  }
}
