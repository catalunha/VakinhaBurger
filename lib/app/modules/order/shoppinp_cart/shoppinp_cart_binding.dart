import 'package:get/get.dart';
import 'package:introducao_flutter/app/modules/order/shoppinp_cart/shoppinp_cart_controller.dart';
import 'package:introducao_flutter/app/repository/order/order_repository.dart';

class ShoppingCartBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderRepository>(() => OrderRepository(restClient: Get.find()));
    Get.lazyPut<ShoppingCartController>(
      () => ShoppingCartController(
        authService: Get.find(),
        shoppingCartService: Get.find(),
        orderRepository: Get.find(),
      ),
    );
  }
}
