import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get.dart';
import 'package:introducao_flutter/app/models/product_model.dart';
import 'package:introducao_flutter/app/models/shopping_cart_model.dart';

class ShoppingCartService extends GetxService {
  final _shoppingCart = <int, ShoppingCartModel>{}.obs;
  List<ShoppingCartModel> get productList => _shoppingCart.values.toList();
  int get totalProducts => _shoppingCart.values.length;
  double get totalValue {
    return _shoppingCart.values.fold(0, (totalValue, shoppingCartModel) {
      totalValue +=
          shoppingCartModel.product.price * shoppingCartModel.quantity;
      return totalValue;
    });
  }

  ShoppingCartModel? getById(int id) => _shoppingCart[id];
  void addOrRemoveProductInShoppingCart(
    ProductModel product, {
    required int quantity,
  }) {
    if (quantity == 0) {
      _shoppingCart.remove(product.id);
    } else {
      _shoppingCart.update(product.id, (product) {
        product.quantity = quantity;
        return product;
      }, ifAbsent: () {
        return ShoppingCartModel(quantity: quantity, product: product);
      });
    }
  }

  void clear() => _shoppingCart.clear();
}
