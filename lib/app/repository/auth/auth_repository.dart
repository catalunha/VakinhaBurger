import 'dart:developer';

import 'package:introducao_flutter/app/core/exceptions/user_notfound.dart';
import 'package:introducao_flutter/app/core/rest_client/rest_client.dart';
import 'package:introducao_flutter/app/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String name, String email, String password);
}

class AuthRepositoryImplement implements AuthRepository {
  final RestClient _restClient;

  AuthRepositoryImplement({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<UserModel> register(String name, String email, String password) async {
    final result = await _restClient.post('/auth/register', {
      'name': name,
      'email': email,
      'password': password,
    });
    if (result.hasError) {
      var message = 'Erro ao registrar usuario';
      if (result.statusCode == 400) {
        message = result.body['erro'];
      }
      log(message, error: result.statusText, stackTrace: StackTrace.current);
      throw RestClientException(message);
    }
    return login(email, password);
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final result = await _restClient.post('/auth/', {
      'email': email,
      'password': password,
    });
    if (result.hasError) {
      if (result.statusCode == 403) {
        log('usuario ou senha inválidos',
            error: result.statusText, stackTrace: StackTrace.current);
        throw UserNotFoundException();
      }
      log('Erro ao autenticar o usuario ${result.statusCode}',
          error: result.statusText, stackTrace: StackTrace.current);
      throw RestClientException('Erro ao autenticar o usuario');
    }
    return UserModel.fromMap(result.body);
  }
}
