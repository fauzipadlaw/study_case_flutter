import 'package:get/get.dart';
import 'package:study_case_flutter/controllers/home_controller.dart';
import 'package:study_case_flutter/providers/home_provider.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeProvider());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
