import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int counter = 0;
  void increment() {
    counter++;
    notifyListeners();
  }

  void decrement() {
    if (counter == 0) {
      counter = 0;
    } else {
      counter--;
    }
    notifyListeners();
  }
}
