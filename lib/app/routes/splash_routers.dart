import 'package:get/route_manager.dart';
import 'package:introducao_flutter/app/modules/splash/splash_binding.dart';
import 'package:introducao_flutter/app/modules/splash/splash_page.dart';

class SplashRouters {
  SplashRouters._();
  static final routers = <GetPage>[
    GetPage(
      name: '/',
      binding: SplashBinding(),
      page: () => const SplashPage(),
    )
  ];
}
