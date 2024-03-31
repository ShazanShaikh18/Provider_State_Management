import 'package:flutter/foundation.dart';

// ChangeNotifier as a setState ka kaam karta he, uske paas global context hota he 
class CountProvider with ChangeNotifier {
  
  int _count = 50;
  int get count => _count;

  void setCount() {
    _count++;
    notifyListeners();
  }
}