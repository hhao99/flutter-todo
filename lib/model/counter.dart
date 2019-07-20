
import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int _value;
  Counter(this._value);

  int get value => this._value;

  increment() {
    this._value ++;
    notifyListeners();
  }
}