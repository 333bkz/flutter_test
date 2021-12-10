import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

@immutable
class Splash extends GetView<SplashController> {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        alignment: Alignment.center,
        child: Image.asset(
          'assets/images/icon_splash.png',
          fit: BoxFit.fill,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
