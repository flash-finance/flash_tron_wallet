import 'package:flutter/cupertino.dart';
import 'package:ota_update/generated/i18n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IndexProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  changeCurrentIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }

  bool _langType = true;

  bool get langType => _langType;

}