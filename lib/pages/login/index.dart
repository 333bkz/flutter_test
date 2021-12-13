import 'package:f_test/pages/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widget/nav.dart';
import 'controller.dart';

@immutable
class Login extends GetView<LoginController> {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: Nav(
          title: '登录',
          context: context,
          onBack: () => controller.onBack(),
        ),
        body: Column(
          children: [
            TextButton(
              onPressed: () => Get.toNamed(Routes.register),
              child: const Text('注册'),
            ),
          ],
        ),
      ),
      onWillPop: () => controller.onBack(),
    );
  }
}
