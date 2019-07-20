import 'package:flutter/foundation.dart' show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

import 'package:desktop/main.dart';

import 'view/counter.dart';
import 'model/counter.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
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