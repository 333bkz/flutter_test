import 'package:flutter/material.dart';
import '../../common/widget/nav.dart';
import '../../controller/global.dart';
import 'package:get/get.dart';

@immutable
class Login extends GetView<GlobalController> {
  const Login({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(Get.arguments);
    return Scaffold(
      appBar: Nav(
        title: '登录',
        context: context,
      ),
      body: Column(
        children: [
          Obx(() => Text("全局数字: ${controller.count}")),
          TextButton(
            onPressed: () => Get.toNamed('/register'),
            child: const Text('我是登录，点我跳转到注册页面'),
          ),
        ],
      ),
    );
  }
}
