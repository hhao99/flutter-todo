import 'package:flutter/foundation.dart' show debugDefaultTargetPlatformOverride;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/todos.dart';
import 'model/todos.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  List<Todo> todos = List.generate(3, (i) => Todo('Task $i'));

  runApp(
    ChangeNotifierProvider(
      builder: (context) => TodosModel(),
      child: MaterialApp(
        title: "todo demo app",
        home: TodosView(),
      )
    )
  );

}