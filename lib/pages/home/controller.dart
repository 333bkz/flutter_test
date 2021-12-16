import 'package:f_test/bean/home.dart';
import 'package:f_test/common/ext.dart';
import 'package:f_test/common/net/request.dart';
import 'package:f_test/res/api.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final tabs = <Classify>[].obs;

  @override
  void onInit() {
    super.onInit();
    "onInit".log();
  }

  @override
  void onReady() {
    "onReady".log();
    requestTabs();
  }

  @override
  void onClose() {}

  void requestTabs() async {
    final result = await Request.get(Api.classify);
    if (result.isSuccess) {
      final List<Classify> data =
          result.data.toJsonArray((json) => Classify.fromJson(json));
      tabs.value = data;
    } else {
      tabs.value = [];
    }
  }
}
