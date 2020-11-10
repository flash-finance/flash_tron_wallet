import 'package:flutter/cupertino.dart';

class IndexProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  changeCurrentIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }
}