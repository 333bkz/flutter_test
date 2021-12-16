import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mmkv/mmkv.dart';

import './pages/config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance?.resamplingEnabled = true;
  await MMKV.initialize(groupDir: "mmkv");
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  runApp(const App());
}

@immutable
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State createState() => AppState();
}

class AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final app = GetMaterialApp(
      debugShowCheckedModeBanner: true,
      initialRoute: Routes.splash,
      enableLog: true,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      getPages: Config.pages,
      initialBinding: Config.initialBinding,
      builder: EasyLoading.init(),
      defaultTransition: Transition.fade,
    );
    return app;
  }
}
