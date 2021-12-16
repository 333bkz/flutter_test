import 'package:f_test/common/ext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class BottomNav extends StatefulWidget {
  final List<String> items;
  final IndexController controller;
  final double size;

  const BottomNav({
    Key? key,
    required this.items,
    required this.controller,
    this.size = 30,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BottomNavState();
  }
}

class _BottomNavState extends State<BottomNav> with TickerProviderStateMixin {
  late final List<AnimationController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = [
      for (var _ in widget.items)
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 1200),
        )
    ];
  }

  @override
  void dispose() {
    super.dispose();
    for (var element in _controllers) {
      element.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    '_BottomNavState build'.log();
    return Obx(
      () => BottomNavigationBar(
        currentIndex: widget.controller.index.value,
        onTap: onTap,
        iconSize: 20,
        type: BottomNavigationBarType.fixed,
        items: [
          for (int i = 0; i < widget.items.length; i++)
            BottomNavigationBarItem(
              icon: Lottie.asset(
                widget.items[i],
                controller: _controllers[i],
                width: widget.size,
                height: widget.size,
                repeat: false,
              ),
              label: "",
            )
        ],
      ),
    );
  }

  onTap(int index) {
    for (int i = 0; i < _controllers.length; i++) {
      if (i == index) {
        _controllers[i].forward();
      } else {
        _controllers[i].value = 0;
      }
    }
    widget.controller.index.value = index;
  }
}

class IndexController {
  final index = 0.obs;
}
