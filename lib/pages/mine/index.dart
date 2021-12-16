import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './controller.dart';

@immutable
class Mine extends GetView<MineController> {
  @override
  MineController get controller => Get.put(MineController());

  const Mine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("mine"));
  }
}
