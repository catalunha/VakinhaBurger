import 'package:get/get.dart';
import 'package:introducao_flutter/app/core/services/auth_services.dart';

class SplashController extends GetxController {
  SplashController();
  void checkLogged() {
    Get.putAsync(() => AuthService().init());
  }
}
