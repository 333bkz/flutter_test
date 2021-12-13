import 'package:f_test/common/constants.dart';
import 'package:flutter/material.dart';

extension LogExt on String {
  log({String? tag}) {
    if (length > 200) {
      printWrapped(tag: tag);
    } else {
      debugPrint(tag ?? TAG + "  " + this);
    }
  }

  printWrapped({String? tag}) {
    final pattern = RegExp('.{1,200}'); // 200 is the size of each chunk
    pattern.allMatches(this).forEach((match) => match.group(0)?.log(tag: tag));
  }
}

///基础类型 不能使用这个？
extension ObjectLogExt on Object {
  log({String? tag}) {
    toString().log(tag: tag);
  }
}
