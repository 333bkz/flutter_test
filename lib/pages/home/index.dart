import 'package:f_test/common/widget/nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './controller.dart';
import '../config.dart';

@immutable
class Home extends GetView<HomeController> {
  @override
  HomeController get controller => Get.put(HomeController());

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final goHome = TextButton(
      onPressed: () => Get.toNamed(Routes.login),
      child: const Text(
        '我是首页，点我跳转到login页面',
        style: TextStyle(color: Color(0xFFFF9000), fontSize: 30),
      ),
    );

    final increment = TextButton(
      onPressed: () => controller.increment(),
      child: const Text('点击测试obx'),
    );

    final column = DefaultTextStyle.merge(
        style: const TextStyle(color: Color(0xFFFF9000), fontSize: 30),
        child: Column(children: [
          goHome,
          increment,
          Obx(() => Text(controller.count.toString())),
          const Text("-------------------------------"),
          TextButton(
            onPressed: () => Get.changeTheme(
                Get.isDarkMode ? ThemeData.light() : ThemeData.dark()),
            child: const Text('切换主题'),
          ),
        ]));
    return Scaffold(
      appBar: Nav(
        title: "首页",
        leftIcon: false,
      ),
      body: Center(child: column),
    );
  }
}
