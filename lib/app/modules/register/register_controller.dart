import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introducao_flutter/app/core/constants/constants.dart';
import 'package:introducao_flutter/app/core/mixins/loader_mixin.dart';
import 'package:introducao_flutter/app/core/mixins/message_mixin.dart';
import 'package:introducao_flutter/app/core/rest_client/rest_client.dart';
import 'package:introducao_flutter/app/repository/auth/auth_repository.dart';

class RegisterController extends GetxController with LoaderMixin, MessageMixin {
  final AuthRepository _authRepository;
  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  RegisterController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      _loading(true);
      final userModel = await _authRepository.register(name, email, password);
      _loading(false);
      GetStorage().write(Constants.userKey, userModel.id);
      // Get.back();
      // _message.value = MessageModel(
      //   title: 'Sucesso',
      //   message: 'Cadastro bem sucedido',
      //   type: MessageType.info,
      // );
    } on RestClientException catch (e, s) {
      _loading(true);
      log('Erro ao registrar usuario', error: e, stackTrace: s);
      _message.value = MessageModel(
        title: 'Erro',
        message: e.message,
        type: MessageType.error,
      );
    } catch (e, s) {
      _loading(true);

      log('Erro GERAL ao registrar usuario', error: e, stackTrace: s);

      _message.value = MessageModel(
        title: 'Erro',
        message: 'Erro GERAL ao registrar usuario',
        type: MessageType.error,
      );
    }
  }
  // void qualquer() {
  //   message.value = MessageModel(
  //     title: 'title',
  //     message: 'message',
  //     type: MessageType.info,
  //   );
  //   // loading.toggle();
  //   // Future.delayed(
  //   //   const Duration(seconds: 2),
  //   //   () => loading.toggle(),
  //   // );
  // }
}
