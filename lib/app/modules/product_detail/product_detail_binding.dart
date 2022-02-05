import 'package:get/get.dart';
import 'package:introducao_flutter/app/modules/product_detail/product_detail_controller.dart';

class ProductDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailController>(
        () => ProductDetailController(shoppingCartService: Get.find()));
  }
}
