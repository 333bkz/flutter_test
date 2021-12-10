import 'package:flutter/material.dart';
import '../../common/widget/nav.dart';
import '../../controller/global.dart';
import 'package:get/get.dart';

@immutable
class Register extends GetView<GlobalController> {
  const Register({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Nav(
        title: '注册',
        context: context,
      ),
      body: Column(
        children: [
          Obx(() => Text("全局数字: ${controller.count}")),
          TextButton(
            onPressed: () => controller.increment(),
            child: const Text('点我全局+1'),
          ),
          TextButton(
            onPressed: () => Get.offAllNamed('/'),
            child: const Text('我是注册，点我跳回首页'),
          ),
        ],
      ),
    );
  }
}
