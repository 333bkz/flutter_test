import 'package:f_test/pages/login/controller.dart';
import 'package:f_test/pages/main/controller.dart';
import 'package:f_test/pages/main/index.dart';
import 'package:f_test/pages/splash/controller.dart';
import 'package:f_test/pages/splash/index.dart';
import 'package:f_test/pages/study/index.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";

import './register/index.dart';
import '../../controller/global.dart';
import 'home/index.dart';
import 'login/view/index.dart';
import 'mine/index.dart';

class Routes {
  static const splash = "/splash";
  static const main = "/main";
  static const login = "/login";
  static const register = "/register";
}

class Config {
  // 路由配置
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.splash,
      page: () => const Splash(),
      binding: BindingsBuilder(() {
        Get.put(SplashController());
      }),
    ),
    GetPage(
      name: Routes.main,
      page: () => Main(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => MainController());
      }),
    ),
    GetPage(
      name: Routes.login,
      page: () => Login(),
      transition: Transition.fadeIn,
      binding: BindingsBuilder(() {
        Get.put(LoginController());
      }),
    ),
    GetPage(
      name: Routes.register,
      page: () => const Register(),
    ),
  ];

  static final List<Widget> maiePages = [
    const Home(),
    const Study(),
    //const Mine(),
    const Mine(),
  ];

  static final List<String> maiePageLottiePaths = [
    "assets/json/main_tab_home.json",
    "assets/json/main_tab_classify.json",
    //"assets/json/main_tab_study.json",
    "assets/json/main_tab_mine.json",
  ];

  // 全局controller配置
  static final Bindings initialBinding = BindingsBuilder(
    () {
      Get.put(GlobalController());
    },
  );
}
