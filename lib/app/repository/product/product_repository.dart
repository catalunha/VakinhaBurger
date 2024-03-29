import 'dart:developer';

import 'package:introducao_flutter/app/core/rest_client/rest_client.dart';
import 'package:introducao_flutter/app/models/product_model.dart';

abstract class ProductRepositoryAbstract {
  Future<List<ProductModel>> findAll();
}

class ProductRepository implements ProductRepositoryAbstract {
  final RestClient _restClient;
  ProductRepository({required RestClient restClient})
      : _restClient = restClient;
  @override
  Future<List<ProductModel>> findAll() async {
    final result = await _restClient.get('/products/');
    if (result.hasError) {
      log(
        'Erro ao buscar produtos ${result.statusCode}',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao buscar produtos');
    }
    return result.body
        .map<ProductModel>((p) => ProductModel.fromMap(p))
        .toList();
  }
}
