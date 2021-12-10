import 'package:get/get.dart';

import '../config.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      Get.offNamed(Routes.home);
    });
  }
}
