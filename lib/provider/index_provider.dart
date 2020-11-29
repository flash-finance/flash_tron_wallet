import 'package:flutter/cupertino.dart';

class IndexProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  changeCurrentIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }

  bool _langType = true;

  bool get langType => _langType;

  String _qrCodeValue = '';

  String get qrCodeValue => _qrCodeValue;

  changeQrCode(String value) {
    _qrCodeValue = value;
    notifyListeners();
  }

}