import 'package:f_test/common/widget/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './controller.dart';
import '../config.dart';

@immutable
class Main extends GetView<MainController> {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Config.maiePages[controller.indexController.index.value]),
      bottomNavigationBar: BottomNav(
        items: Config.maiePageLottiePaths,
        controller: controller.indexController,
      ),
    );
  }
}
