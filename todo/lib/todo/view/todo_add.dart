import 'package:flutter/material.dart';

class TodoAddView extends StatelessWidget {
  TodoAddView({super.key});

  @override
  build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add Todo")),
        body: Container(
          child: Text("Add"),
        ));
  }
}
