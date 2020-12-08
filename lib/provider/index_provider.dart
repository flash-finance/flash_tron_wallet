import 'package:flash_tron_wallet/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IndexProvider with ChangeNotifier {
  
  void init() {
    SharedPreferences.getInstance().then((prefs) {
      if (prefs.getBool(_langTypeKey) != null) {
        bool temp = prefs.getBool(_langTypeKey);
        _langType = temp;
      }
      if (_langType) {
        S.load(Locale('zh', ''));
      } else {
        S.load(Locale('en', ''));
      }
      notifyListeners();
    });
  }

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  changeCurrentIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }

  bool _langType = true;

  bool get langType => _langType;

  String _langTypeKey =  'langTypeKey';

  changeLangType() async {
    _langType = !_langType;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_langTypeKey, _langType);
    if (_langType) {
      S.load(Locale('zh', ''));
    } else {
      S.load(Locale('en', ''));
    }
    notifyListeners();
  }


}