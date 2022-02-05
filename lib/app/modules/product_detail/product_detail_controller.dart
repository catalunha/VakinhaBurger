import 'package:get/get.dart';
import 'package:introducao_flutter/app/core/services/shopping_card_service.dart';
import 'package:introducao_flutter/app/models/product_model.dart';

class ProductDetailController extends GetxController {
  final _product = Rx<ProductModel>(Get.arguments);
  ProductModel get product => _product.value;

  final _totalPrice = 0.0.obs;
  double get totalPrice => _totalPrice.value;

  final _quantity = 1.obs;
  int get quantity => _quantity.value;

  final _alreadyAdded = false.obs;
  bool get alreadyAdded => _alreadyAdded.value;

  final ShoppingCartService _shoppingCartService;

  ProductDetailController({required ShoppingCartService shoppingCartService})
      : _shoppingCartService = shoppingCartService;

  @override
  void onInit() {
    super.onInit();
    _totalPrice(product.price);
    ever<int>(_quantity, (quantity) {
      _totalPrice(product.price * quantity);
    });
    final productShoppingCart = _shoppingCartService.getById(product.id);
    if (productShoppingCart != null) {
      _quantity(productShoppingCart.quantity);
      _alreadyAdded(true);
    }
  }

  void plusProduct() {
    _quantity.value += 1;
  }

  void minusProduct() {
    if (_quantity > 1) {
      _quantity.value -= 1;
    }
  }

  void addProductInShoppingCart() {
    _shoppingCartService.addOrRemoveProductInShoppingCart(product,
        quantity: quantity);
    Get.back();
  }
}
