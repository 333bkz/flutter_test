import 'dart:convert';

import 'package:f_test/res/constants.dart';
import 'package:flutter/material.dart';

extension LogExt on String {
  log({String? tag}) {
    if (length > 100) {
      printWrapped(tag: tag);
    } else {
      debugPrint(tag ?? Constants.TAG + "  " + this);
    }
  }

  printWrapped({String? tag}) {
    final pattern = RegExp('.{1,100}'); // 100 is the size of each chunk
    pattern.allMatches(this).forEach((match) => match.group(0)?.log(tag: tag));
  }
}

///基础类型 不能使用这个？
extension ObjectLogExt on Object {
  log({String? tag}) {
    toString().log(tag: tag);
  }
}

extension JsonExt on String {
  T toJsonObject<T>(T Function(Map<String, dynamic>) fromJson) {
    return fromJson.call(jsonDecode(this));
  }

  List<T> toJsonArray<T>(T Function(Map<String, dynamic>) fromJson) {
    return (jsonDecode(this) as List).map((e) => fromJson.call(e)).toList();
  }
}
