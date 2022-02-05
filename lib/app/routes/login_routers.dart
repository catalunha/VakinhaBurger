import 'package:get/route_manager.dart';
import 'package:introducao_flutter/app/modules/login/login_binding.dart';
import 'package:introducao_flutter/app/modules/login/login_page.dart';

class LoginRouters {
  LoginRouters._();
  static final routers = <GetPage>[
    GetPage(
      name: '/login',
      binding: LoginBinding(),
      page: () => const LoginPage(),
    )
  ];
}
