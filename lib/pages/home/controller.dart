import 'package:get/get.dart';

class HomeController extends GetxController {
  var count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {}
  @override
  void onClose() {}

  void getData() {
    // 请求页面数据
    print("111");
  }

  void increment() => count.value++;
}
