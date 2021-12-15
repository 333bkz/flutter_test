import 'package:f_test/bean/home.dart';
import 'package:f_test/bean/user.dart';
import 'package:f_test/common/ext.dart';
import 'package:f_test/common/net/path.dart';
import 'package:f_test/common/net/request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../config.dart';

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
  ///  resumed:应用可见并可响应用户操作
  ///  inactive:用户可见，但不可响应用户操作
  ///  paused:已经暂停了，用户不可见、不可操作
  ///  suspending：应用被挂起，此状态IOS永远不会回调
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

  Future<bool> onBack() {
    if (Get.arguments == true) {
      Get.offNamed(Routes.home);
    } else {
      Get.back();
    }
    return Future.value(false);
  }

  void login(String account, String password) async {
    final result = await Request.post(
      Api.login,
      data: {"username": account, "password": password},
    );
    if (result.isSuccess) {
      final user = result.data.toJsonObject((json) => User.fromJson(json));
      user.log();
      EasyLoading.showSuccess("登陆成功");
      onBack();
    }
  }

  void homeClassify() async {
    final result = await Request.get(Api.classify);
    if (result.isSuccess) {
      final List<Classify> data =
          result.data.toJsonArray((json) => Classify.fromJson(json));
      for (var item in data) {
        item.log();
      }
    }
  }
}
