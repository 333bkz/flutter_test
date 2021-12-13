import 'package:f_test/common/ext.dart';
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
    return Scaffold(
      appBar: Nav(
        title: '登录',
        context: context,
        onBack: () {
          "from splash ${Get.arguments}".log();
          if (Get.arguments == true) {
            Get.offNamed(Routes.home);
          } else {
            Get.back();
          }
        },
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () => Get.toNamed(Routes.register),
            child: const Text('注册'),
          ),
        ],
      ),
    );
  }
}
