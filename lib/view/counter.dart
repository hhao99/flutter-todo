import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provide/provide.dart';
import 'package:flutter/gestures.dart';

import '../app.dart';
import '../model/counter.dart';

class CounterView extends StatefulWidget {
  final title;


  CounterView({this.title});

  State<StatefulWidget> createState() => _CounterState();

}

class _CounterState extends State<CounterView> {
  @override 
  Widget build(BuildContext context) {

    final currentCounter = Provide.value<Counter>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Counter demo")),
      body:Column(
      children: <Widget>[
        MyContainer(
          height: 120,
          child: Text("Counter App Demo ")
          ),
        MyContainer(
          height: 360,
          child: Provide<Counter>(
              builder: (context, child, counter) => Text(
                '${counter.value}',
                style: TextStyle(
                  fontSize: 96.0,
                  color: Colors.white,)
                ),
            ),
          ),
        Listener(
          onPointerEnter: (evnet) {
            currentCounter.increment();
          },
          onPointerHover: (event) {
            currentCounter.increment();
          },
          child:
          Container(
          height: 100,
          width:600,
          color: Colors.red,
          child: null,
          ),
        ),
        
      ],
    ),

    ); 
    

  }

  
}