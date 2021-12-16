import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './controller.dart';

@immutable
class Study extends GetView<StudyController> {
  @override
  StudyController get controller => Get.put(StudyController());

  const Study({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("study"));
  }
}
