import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

import 'view/counter.dart';
import 'model/counter.dart';

void main() {

  final providers = Providers()
      ..provide(Provider.function((context) => Counter(0)));
  runApp(
    ProviderNode(
      providers: providers,
      child: MaterialApp(
        title: "counter demo",
        home: CounterView()
        ),
    )
  );
} 

