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
    final winSize = MediaQuery.of(context).size;
    return WillPopScope(
      child: Stack(
        children: [
          SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()),
            reverse: false,
            child: SizedBox(
              width: winSize.width,
              height: winSize.height,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 50, bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _children(),
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            child: Back(
              onBack: () {
                controller.onBack();
              },
            ),
          ),
        ],
      ),
      onWillPop: () => controller.onBack(),
    );
  }

  List<Widget> _children() {
    return [
      Image.asset(
        'assets/images/icon_splash.png',
        height: 140,
        width: 140,
      ),
      TextButton(
        onPressed: () => Get.toNamed(Routes.register),
        child: const Text('注册', style: TextStyle(fontSize: 30)),
      ),
    ];
  }
}
