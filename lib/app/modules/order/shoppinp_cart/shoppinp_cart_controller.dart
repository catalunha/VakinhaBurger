import 'package:get/get.dart';
import 'package:introducao_flutter/app/core/services/auth_services.dart';
import 'package:introducao_flutter/app/core/services/shopping_card_service.dart';
import 'package:introducao_flutter/app/models/order.dart';
import 'package:introducao_flutter/app/models/shopping_cart_model.dart';
import 'package:introducao_flutter/app/modules/home/home_controller.dart';
import 'package:introducao_flutter/app/repository/order/order_repository.dart';

class ShoppingCartController extends GetxController {
  final AuthService _authService;
  final ShoppingCartService _shoppingCartService;
  final OrderRepository _orderRepository;
  ShoppingCartController(
      {required AuthService authService,
      required ShoppingCartService shoppingCartService,
      required OrderRepository orderRepository})
      : _authService = authService,
        _shoppingCartService = shoppingCartService,
        _orderRepository = orderRepository;

  final _address = ''.obs;
  set address(String value) => _address.value = value;
  final _cpf = ''.obs;
  set cpf(String value) => _cpf.value = value;
  List<ShoppingCartModel> get productList => _shoppingCartService.productList;
  double get totalValue => _shoppingCartService.totalValue;

  void addQuantityInProduct(ShoppingCartModel shoppingCartModel) {
    _shoppingCartService.addOrRemoveProductInShoppingCart(
        shoppingCartModel.product,
        quantity: shoppingCartModel.quantity + 1);
  }

  void subtractQuantityInProduct(ShoppingCartModel shoppingCartModel) {
    _shoppingCartService.addOrRemoveProductInShoppingCart(
        shoppingCartModel.product,
        quantity: shoppingCartModel.quantity - 1);
  }

  void clear() => _shoppingCartService.clear();

  Future<void> createOrder() async {
    final userId = _authService.getUserId();
    final order = Order(
      userId: userId!,
      cpf: _cpf.value,
      address: _address.value,
      itens: productList,
    );
    var orderPix = await _orderRepository.createOrder(order);
    orderPix = orderPix.copyWith(totalValue: totalValue);
    clear();
    Get.offNamed('/orders/finished', arguments: orderPix);
    Get.back(id: HomeController.navigatorKey);
  }
}
