import 'dart:developer';

import 'package:introducao_flutter/app/core/rest_client/rest_client.dart';
import 'package:introducao_flutter/app/models/order.dart';
import 'package:introducao_flutter/app/models/order_pix.dart';

abstract class OrderRepositoryAbstract {
  Future<OrderPix> createOrder(Order order);
}

class OrderRepository implements OrderRepositoryAbstract {
  final RestClient _restClient;

  OrderRepository({required RestClient restClient}) : _restClient = restClient;
  @override
  Future<OrderPix> createOrder(Order order) async {
    final result = await _restClient.post(
      '/order/',
      {
        'userId': order.userId,
        'cpf': order.cpf,
        'address': order.address,
        'items': order.itens
            .map(
              (shoppingCart) => {
                'quantity': shoppingCart.quantity,
                'productId': shoppingCart.product.id,
              },
            )
            .toList(),
      },
    );
    if (result.hasError) {
      log(
        'Erro ao realizar o pedido ${result.statusCode}',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao realizar pedido');
    }
    return OrderPix.fromMap(result.body);
  }
}
