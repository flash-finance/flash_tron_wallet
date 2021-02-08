import 'package:flash_tron_wallet/provider/global_service.dart';
import 'package:get/get.dart';

class GlobalInjection {
  static Future<void> init() async {
    Get.put(GlobalService());
  }
}
