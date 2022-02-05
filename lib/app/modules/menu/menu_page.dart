import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introducao_flutter/app/modules/menu/menu_controller.dart';
import 'package:introducao_flutter/app/modules/menu/widgets/product_tile.dart';

class MenuPage extends GetView<MenuController> {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: controller.menu.length,
        itemBuilder: (context, index) {
          final product = controller.menu[index];
          return ProductTile(product: product);
        },
      ),
    );
  }
}
