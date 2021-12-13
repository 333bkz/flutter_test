import 'package:f_test/pages/login/controller.dart';
import 'package:f_test/pages/splash/controller.dart';
import 'package:f_test/pages/splash/index.dart';
import "package:get/get.dart";

import './login/index.dart';
import './register/index.dart';
import '../../controller/global.dart';
import 'home/controller.dart';
import 'home/index.dart';

class Routes {
  static const splash = "/splash";
  static const home = "/home";
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
      name: Routes.home,
      page: () => const Home(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => HomeController());
      }),
    ),
    GetPage(
      name: Routes.login,
      page: () => const Login(),
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

  // 全局controller配置
  static final Bindings initialBinding = BindingsBuilder(
    () {
      Get.put(GlobalController());
    },
  );
}
