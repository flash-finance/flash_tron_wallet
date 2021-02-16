import 'package:get/get.dart';

class TradeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  var _swapLeftIndex = Rx<int>(0);

  int get swapLeftIndex => _swapLeftIndex.value;

  changeSwapLeftIndex(int value) {
    _swapLeftIndex.value = value;
  }

  var _swapRightIndex = Rx<int>(1);

  int get swapRightIndex => _swapRightIndex.value;

  changeSwapRightIndex(int value) {
    _swapRightIndex.value = value;
  }
}
