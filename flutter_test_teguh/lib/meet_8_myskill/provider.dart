import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterModel extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void increment(){
    _counter++;
    notifyListeners();
  }

  void decrement(){
    _counter--;
    notifyListeners();
  }

}

final counterProvider = StateProvider<int>((ref) {
 return 0;
});