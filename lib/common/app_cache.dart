import 'package:mmkv/mmkv.dart';

class AppCache {
  AppCache._privateConstructor();

  static final AppCache _instance = AppCache._privateConstructor();

  static AppCache get instance {
    return _instance;
  }

  final _mmkv = MMKV("test");

  bool get isLogin => _mmkv.decodeBool("is_login", defaultValue: false);

  ///isLogin = false;
  set isLogin(bool value) => _mmkv.encodeBool("is_login", value);
}
