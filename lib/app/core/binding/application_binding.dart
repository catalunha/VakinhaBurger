import 'package:get/get.dart';
import 'package:introducao_flutter/app/core/rest_client/rest_client.dart';
import 'package:introducao_flutter/app/core/services/shopping_card_service.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestClient>(() => RestClient(), fenix: true);
    Get.lazyPut(() => ShoppingCartService());
  }
}
