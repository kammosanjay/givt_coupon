import 'package:flutter/foundation.dart';

class CounterProvider extends ChangeNotifier {
  int count = 0;
  int count1 = 0;
  int get getCount1 => count1;
  int get getCount => count;



  incrementCounter() {
    count++;
    notifyListeners();
  }


  incrementCounter1() {
    count--;
    notifyListeners();
  }


}
