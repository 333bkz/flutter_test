import 'package:f_test/res/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginInput extends StatelessWidget {
  final TextEditingController controller;
  final String? hint;
  final IconData icon;
  final bool isShowEye;
  final int? maxLength;

  const LoginInput({
    Key? key,
    required this.controller,
    required this.icon,
    this.isShowEye = false,
    this.hint,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isObscure = true.obs;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(.5), width: 1),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Obx(
        () => TextField(
          obscureText: isObscure.value && isShowEye,
          controller: controller,
          maxLength: maxLength,
          maxLines: 1,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey),
            counterText: "",
            prefixIcon: Icon(icon, color: Colors.grey),
            suffix: isShowEye
                ? InkWell(
                    onTap: () => isObscure.value = !isObscure.value,
                    child: Container(
                      padding: const EdgeInsets.only(right: 8),
                      child: Icon(
                        isObscure.value ? AppIcon.icon_hide : AppIcon.icon_show,
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
