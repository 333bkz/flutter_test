import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './controller.dart';

@immutable
class Home extends GetView<HomeController> {
  @override
  HomeController get controller => Get.put(HomeController());

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final winSize = MediaQueryData.fromWindow(window);
    return Obx(() {
      final tabs = controller.tabs;
      return DefaultTabController(
          length: tabs.length,
          child: Scaffold(
            appBar: TabBar(
              padding: EdgeInsets.only(top: winSize.padding.top),
              physics: const BouncingScrollPhysics(),
              isScrollable: true,
              tabs: [
                for (var item in tabs)
                  Tab(
                    child: Text(
                      item.groupName,
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
              ],
            ),
            body: const Center(child: Text("home")),
          ));
    });
  }
}
