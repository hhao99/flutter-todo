import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'model/todos.dart';
import 'view/todos.dart';



void main() {

  runApp(
    MaterialApp(
      title: "todo app",
      home:  ChangeNotifierProvider(
          builder: (context) => TodosModel(),
          child: MaterialApp(
            title: "todo demo app",
            home: TodosView(),
          )
      )
    )

  );


} 

