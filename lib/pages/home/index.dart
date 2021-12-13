import 'package:f_test/common/request.dart';
import 'package:f_test/common/widget/nav.dart';
import 'package:f_test/pages/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import './controller.dart';

@immutable
class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
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
            onPressed: () => box.write('name', '111111'),
            child: const Text('存储本地数据'),
          ),
          TextButton(
            onPressed: () => Get.changeTheme(
                Get.isDarkMode ? ThemeData.light() : ThemeData.dark()),
            child: const Text('切换主题'),
          ),
          TextButton(
            onPressed: () async {
              // 发起请求
              final res = await Request.get('/update.json');
              debugPrint(res);
            },
            child: const Text('测试各种操作'),
          ),
        ]));

    debugPrint(box.read('name'));
    return Scaffold(
      appBar: Nav(
        title: "首页",
        leftIcon: false,
      ),
      body: Center(child: column),
    );
  }
}
