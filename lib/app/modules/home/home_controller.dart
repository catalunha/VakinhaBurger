import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';
import 'package:introducao_flutter/app/core/services/auth_services.dart';
import 'package:introducao_flutter/app/core/services/shopping_card_service.dart';
import 'package:introducao_flutter/app/modules/menu/menu_binding.dart';
import 'package:introducao_flutter/app/modules/menu/menu_page.dart';
import 'package:introducao_flutter/app/modules/order/shoppinp_cart/shoppinp_cart_binding.dart';
import 'package:introducao_flutter/app/modules/order/shoppinp_cart/shoppinp_cart_page.dart';

class HomeController extends GetxController {
  final ShoppingCartService _shoppingCartService;
  HomeController({required ShoppingCartService shoppingCartService})
      : _shoppingCartService = shoppingCartService;
  static const navigatorKey = 1;
  int get totalProductInShoppingCart => _shoppingCartService.totalProducts;
  final _tabList = ['/menu', '/order/shopping_cart', '/exit'];
  final _tabIndex = 0.obs;
  int get tabIndex => _tabIndex.value;
  set tabIndex(int index) {
    _tabIndex(index);
    if (_tabList[index] == '/exit') {
      Get.find<AuthService>().logout();
    } else {
      Get.toNamed(_tabList[index], id: navigatorKey);
    }
  }

  Route? onGeneratorRouter(RouteSettings settings) {
    if (settings.name == '/menu') {
      return GetPageRoute(
        settings: settings,
        page: () => const MenuPage(),
        binding: MenuBinding(),
        transition: Transition.fadeIn,
      );
    }
    if (settings.name == '/order/shopping_cart') {
      return GetPageRoute(
        settings: settings,
        page: () => ShoppingCartPage(),
        binding: ShoppingCartBinding(),
        transition: Transition.fadeIn,
      );
    }
  }
}
