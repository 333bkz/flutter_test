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
        appBar: _appbar(context),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ), //ios风格的上拉出来空白
          reverse: false, //滚动视图是否在阅读方向上滚动。
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _children(),
            ),
          ),
        ),
      ),
      onWillPop: () => controller.onBack(),
    );
  }

  Nav _appbar(BuildContext context) => Nav(
        title: '登录',
        context: context,
        onBack: () => controller.onBack(),
      );

  List<Widget> _children() {
    return [
      TextButton(
        onPressed: () => Get.toNamed(Routes.register),
        child: const Text('注册', style: TextStyle(fontSize: 30)),
      ),
      const Padding(padding: EdgeInsets.only(bottom: 100)),
    ];
  }
}
