import 'package:get/route_manager.dart';
import 'package:introducao_flutter/app/modules/register/register_binding.dart';
import 'package:introducao_flutter/app/modules/register/register_page.dart';

class RegisterRouters {
  RegisterRouters._();
  static final routers = <GetPage>[
    GetPage(
      name: '/register',
      binding: RegisterBinding(),
      page: () => const RegisterPage(),
    )
  ];
}
