import 'package:get/get.dart';
import 'package:introducao_flutter/app/modules/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
        () => HomeController(shoppingCartService: Get.find()));
  }
}
