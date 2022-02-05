import 'package:get/get.dart';
import 'package:introducao_flutter/app/modules/menu/menu_controller.dart';
import 'package:introducao_flutter/app/repository/product/product_repository.dart';

class MenuBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductRepository>(
        () => ProductRepository(restClient: Get.find()));
    Get.lazyPut<MenuController>(
        () => MenuController(productRepository: Get.find()));
  }
}
