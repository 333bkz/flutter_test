import 'package:f_test/common/app_cache.dart';
import 'package:get/get.dart';

import '../config.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (AppCache.instance.isLogin) {
        Get.offNamed(Routes.home);
      } else {
        Get.offNamed(Routes.login, arguments: true);
      }
    });
  }
}
