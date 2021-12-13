import 'package:f_test/common/app_cache.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config.dart';

class SplashController extends GetxController with WidgetsBindingObserver {
  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance?.addObserver(this);
    debugPrint("onInit");
  }

  @override
  void onClose() {
    super.onClose();
    WidgetsBinding.instance?.removeObserver(this);
    debugPrint("onClose");
  }

  ///生命周期变化时回调
//  resumed:应用可见并可响应用户操作
//  inactive:用户可见，但不可响应用户操作
//  paused:已经暂停了，用户不可见、不可操作
//  suspending：应用被挂起，此状态IOS永远不会回调
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    debugPrint("didChangeAppLifecycleState: ${state.name}");
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    debugPrint("didChangeMetrics");
  }

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (AppCache.instance.isLogin) {
        Get.offNamed(Routes.home);
      } else {
        Get.offNamed(Routes.login);
      }
    });
  }
}
