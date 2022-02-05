import 'package:get/get.dart';
import 'package:introducao_flutter/app/core/rest_client/rest_client.dart';
import 'package:introducao_flutter/app/modules/register/register_controller.dart';
import 'package:introducao_flutter/app/repository/auth/auth_repository.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImplement(
        restClient: Get.find<RestClient>(),
      ),
    );
    Get.lazyPut<RegisterController>(
      () => RegisterController(
        authRepository: Get.find<AuthRepository>(),
      ),
    );
  }
}
