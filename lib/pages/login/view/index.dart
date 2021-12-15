import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widget/nav.dart';
import '../controller.dart';
import 'input.dart';

@immutable
class Login extends GetView<LoginController> {
  Login({Key? key}) : super(key: key);

  final _usernameController = TextEditingController(text: '18565731244');
  final _passwordController = TextEditingController(text: '000000');

  @override
  Widget build(BuildContext context) {
    final winSize = MediaQuery.of(context).size;
    return WillPopScope(
      child: Stack(
        children: [
          SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()),
            reverse: false,
            child: SizedBox(
              width: winSize.width,
              height: winSize.height,
              child: Container(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 50, bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _children(winSize),
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            child: Back(
              onBack: () {
                controller.onBack();
              },
            ),
          ),
        ],
      ),
      onWillPop: () => controller.onBack(),
    );
  }

  List<Widget> _children(Size size) {
    return [
      Image.asset(
        'assets/images/icon_login.png',
        width: 140,
      ),
      const SizedBox(height: 15),
      LoginInput(
        controller: _usernameController,
        icon: Icons.person_outline,
        hint: "请输入用户名",
        maxLength: 11,
      ),
      const SizedBox(height: 15),
      LoginInput(
          controller: _passwordController,
          icon: Icons.lock_outline,
          isShowEye: true,
          hint: "请输入密码",
          maxLength: 20),
      const SizedBox(height: 25),
      MaterialButton(
        onPressed: () {
          controller.login(_usernameController.text, _passwordController.text);
          // controller.homeClassify();
        },
        minWidth: double.infinity,
        height: 50.0,
        color: Colors.green,
        child: const Text(
          "登陆",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    ];
  }
}
