import 'package:flutter/material.dart';

class LoginInput extends StatefulWidget {
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
  State<StatefulWidget> createState() {
    return _InputState();
  }
}

class _InputState extends State<LoginInput> {
  final GlobalKey<_EditState> editKey = GlobalKey<_EditState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(.5), width: 1),
        borderRadius: BorderRadius.circular(5.0),
      ),
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Icon(widget.icon, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: _Edit(
              key: editKey,
              controller: widget.controller,
              hint: widget.hint,
              icon: widget.icon,
              maxLength: widget.maxLength,
            ),
          ),
          Offstage(
            offstage: !widget.isShowEye,
            child: _Eye(
              onStateChange: (bool _isEncrypt) {
                editKey.currentState?.setIsObscure(_isEncrypt);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Edit extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final IconData? icon;
  final int? maxLength;

  const _Edit({Key? key, this.controller, this.hint, this.icon, this.maxLength})
      : super(key: key);

  @override
  _EditState createState() {
    return _EditState();
  }
}

class _EditState extends State<_Edit> {
  bool _isObscure = false;

  void setIsObscure(bool value) {
    setState(() {
      _isObscure = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _isObscure,
      controller: widget.controller,
      maxLength: widget.maxLength,
      maxLines: 1,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: widget.hint,
        hintStyle: const TextStyle(color: Colors.grey),
        counterText: "", //计数hide
        //suffix: null, //_Eye可用这个代替
      ),
    );
  }
}

class _Eye extends StatefulWidget {
  final Function(bool)? onStateChange;

  const _Eye({this.onStateChange});

  @override
  _EyeState createState() {
    return _EyeState();
  }
}

class _EyeState extends State<_Eye> {
  bool _isEncrypt = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          _isEncrypt = !_isEncrypt;
          widget.onStateChange?.call(_isEncrypt);
        });
      },
      icon: Image.asset(
        _isEncrypt
            ? 'assets/images/icon_eye_closed.png'
            : 'assets/images/icon_eye.png',
        height: 26,
        width: 26,
      ),
    );
  }
}
