import 'dart:developer';

import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introducao_flutter/app/core/constants/constants.dart';
import 'package:introducao_flutter/app/core/exceptions/user_notfound.dart';
import 'package:introducao_flutter/app/core/mixins/loader_mixin.dart';
import 'package:introducao_flutter/app/core/mixins/message_mixin.dart';
import 'package:introducao_flutter/app/repository/auth/auth_repository.dart';

class LoginController extends GetxController with LoaderMixin, MessageMixin {
  final AuthRepository _authRepository;
  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  LoginController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      _loading(true);
      final userLogged = await _authRepository.login(email, password);
      final storage = GetStorage();
      storage.write(Constants.userKey, userLogged.id);
      _loading(false);
    } on UserNotFoundException catch (e, s) {
      _loading(true);
      log('Login ou senha invalidos', error: e, stackTrace: s);
      _message.value = MessageModel(
        title: 'Erro',
        message: 'email ou senha invalidos',
        type: MessageType.error,
      );
      _loading(false);
    } catch (e, s) {
      _loading(true);
      log('Erro ao realizar login', error: e, stackTrace: s);
      _message.value = MessageModel(
        title: 'Erro',
        message: 'Erro ao realizar login',
        type: MessageType.error,
      );
      _loading(false);
    }
  }
}
