import 'package:f_test/common/ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with WidgetsBindingObserver {

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance?.addObserver(this);
    "onInit".log();
  }

  @override
  void onClose() {
    super.onClose();
    WidgetsBinding.instance?.removeObserver(this);
    "onClose".log();
  }

  ///生命周期变化时回调
//  resumed:应用可见并可响应用户操作
//  inactive:用户可见，但不可响应用户操作
//  paused:已经暂停了，用户不可见、不可操作
//  suspending：应用被挂起，此状态IOS永远不会回调
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    "didChangeAppLifecycleState: ${state.name}".log();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    "didChangeMetrics".log();
  }
}
