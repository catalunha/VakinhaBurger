import 'package:get/get_connect.dart';

class RestClient extends GetConnect {
  final String _backendBaseUrl = 'http://192.168.10.101:8080';
  // final String _backendBaseUrl = 'http://dartweek.academiadoflutter.com.br';
  RestClient() {
    httpClient.baseUrl = _backendBaseUrl;
  }
}

class RestClientException implements Exception {
  final int? code;
  final String message;

  RestClientException(
    this.message, {
    this.code,
  });

  @override
  String toString() => 'RestClientException(code: $code, message: $message)';
}
