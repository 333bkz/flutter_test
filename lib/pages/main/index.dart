import 'package:f_test/common/widget/bottom_nav.dart';
import 'package:f_test/common/widget/nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './controller.dart';
import '../config.dart';

@immutable
class Main extends GetView<MainController> {
  final _controller = IndexController();

  Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Config.maiePages[_controller.index.value]),
      bottomNavigationBar: BottomNav(
        items: const [
          "assets/json/main_tab_home.json",
          "assets/json/main_tab_classify.json",
          "assets/json/main_tab_study.json",
          "assets/json/main_tab_mine.json",
        ],
        controller: _controller,
      ),
    );
  }
}
