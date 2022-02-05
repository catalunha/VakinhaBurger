import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introducao_flutter/app/core/services/auth_services.dart';
import 'package:introducao_flutter/app/core/ui/app_appbar.dart';
import 'package:introducao_flutter/app/core/ui/app_icon_badge.dart';
import 'package:introducao_flutter/app/modules/home/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            onTap: (value) => controller.tabIndex = value,
            currentIndex: controller.tabIndex,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Produto',
              ),
              BottomNavigationBarItem(
                icon: IconBadge(
                  icon: Icons.shopping_cart,
                  number: controller.totalProductInShoppingCart,
                ),
                label: 'Carrinho',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.exit_to_app),
                label: 'Sair',
              ),
            ],
          )),
      body: Navigator(
        initialRoute: '/menu',
        key: Get.nestedKey(HomeController.navigatorKey),
        onGenerateRoute: controller.onGeneratorRouter,
      ),
      // body: Center(
      //   child: TextButton(
      //     child: const Text('Logout'),
      //     onPressed: () {
      //       Get.find<AuthService>().logout();
      //     },
      //   ),
      // ),
    );
  }
}
