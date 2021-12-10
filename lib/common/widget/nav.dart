import 'package:flutter/material.dart';
import 'package:get/get.dart';

// title：页面标题
// leftIcon = false，不显示返回按钮 ,leftIcon不填则为默认返回按钮，否则为leftIcon
class Nav extends AppBar {
  Nav({Key? key, title, leftIcon, BuildContext? context})
      : super(
            key: key,
            title: Text(title),
            leading: leftIcon == false
                ? null
                : leftIcon ??
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Get.back();
                      },
                    ));
}
