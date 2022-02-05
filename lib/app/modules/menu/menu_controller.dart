import 'dart:developer';

import 'package:get/get.dart';
import 'package:introducao_flutter/app/core/mixins/loader_mixin.dart';
import 'package:introducao_flutter/app/core/mixins/message_mixin.dart';
import 'package:introducao_flutter/app/models/product_model.dart';
import 'package:introducao_flutter/app/repository/product/product_repository.dart';

class MenuController extends GetxController with LoaderMixin, MessageMixin {
  final ProductRepository _productRepository;
  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  final menu = <ProductModel>[].obs;
  MenuController({required ProductRepository productRepository})
      : _productRepository = productRepository;
  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      _loading.toggle();
      await findAll();
      _loading.toggle();
    } catch (e, s) {
      _loading.toggle();
      log(
        'Erro ao buscar produtos',
        error: e,
        stackTrace: s,
      );
      _message(MessageModel(
          title: 'Erro',
          message: 'Erro ao buscar menu',
          type: MessageType.error));
    }
  }

  Future<void> findAll() async {
    final products = await _productRepository.findAll();
    menu.assignAll(products);
  }
}
