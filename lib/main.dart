import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introducao_flutter/app/core/binding/application_binding.dart';
import 'package:introducao_flutter/app/core/ui/app_theme.dart';
import 'package:introducao_flutter/app/routes/orders_routes.dart';
import 'package:introducao_flutter/app/routes/home_routes.dart';
import 'package:introducao_flutter/app/routes/login_routers.dart';
import 'package:introducao_flutter/app/routes/product_detail_routes.dart';
import 'package:introducao_flutter/app/routes/register_routers.dart';
import 'package:introducao_flutter/app/routes/splash_routers.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vakinha Burger',
      theme: AppTheme.theme,
      initialBinding: ApplicationBinding(),
      getPages: [
        ...SplashRouters.routers,
        ...LoginRouters.routers,
        ...RegisterRouters.routers,
        ...HomeRouters.routers,
        ...ProductDetailRouters.routers,
        ...OrdersRouters.routers,
        // GetPage(
        //   name: '/',
        //   binding: HomeBinding(),
        //   page: () => const HomePage(),
        // ),
        // GetPage(
        //   name: '/produto',
        //   binding: ProdutoBinding(),
        //   page: () => const ProdutoPage(),
        // ),
      ],
    );
  }
}
