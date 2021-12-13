
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mmkv/mmkv.dart';

import './pages/config.dart';

void main() async {
  //runZoned(() async {
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance?.resamplingEnabled = true;
  await GetStorage.init();
  await MMKV.initialize(groupDir:"mmkv");
  runApp(const App());
  //});
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
      title: 'Flutter',
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
