import 'package:get/get.dart';
import 'package:introducao_flutter/app/core/rest_client/rest_client.dart';
import 'package:introducao_flutter/app/modules/login/login_controller.dart';
import 'package:introducao_flutter/app/repository/auth/auth_repository.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImplement(
        restClient: Get.find<RestClient>(),
      ),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(
        authRepository: Get.find<AuthRepository>(),
      ),
    );
  }
}
