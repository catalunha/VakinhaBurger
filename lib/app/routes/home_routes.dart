import 'package:get/route_manager.dart';
import 'package:introducao_flutter/app/modules/home/home_binding.dart';
import 'package:introducao_flutter/app/modules/home/home_page.dart';

class HomeRouters {
  HomeRouters._();
  static final routers = <GetPage>[
    GetPage(
      name: '/home',
      binding: HomeBinding(),
      page: () => const HomePage(),
    )
  ];
}
