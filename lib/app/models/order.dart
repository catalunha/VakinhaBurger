import 'package:introducao_flutter/app/models/shopping_cart_model.dart';

class Order {
  int userId;
  String cpf;
  String address;
  List<ShoppingCartModel> itens;
  Order({
    required this.userId,
    required this.cpf,
    required this.address,
    required this.itens,
  });
}
