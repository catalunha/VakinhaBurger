import 'package:flutter/material.dart';
import 'package:introducao_flutter/app/core/ui/app_appbar.dart';
import 'package:get/get.dart';
import 'package:introducao_flutter/app/core/ui/app_button.dart';
import 'package:introducao_flutter/app/core/ui/app_theme.dart';
import 'package:introducao_flutter/app/core/ui/formater_helper.dart';
import 'package:introducao_flutter/app/core/ui/app_plus_minus_box.dart';
import 'package:introducao_flutter/app/modules/product_detail/product_detail_controller.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(),
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: context.width,
                    height: context.heightTransformer(reducedBy: 60),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'http://dartweek.academiadoflutter.com.br/images${controller.product.image}'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.product.name,
                      style: context.textTheme.headline4!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      controller.product.description,
                      style: context.textTheme.bodyText2!.copyWith(
                        color: Colors.black,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(() => AppPlusMinusBox(
                        // label: 'X-TUDAO',
                        onMinus: () => controller.minusProduct(),
                        quantity: controller.quantity,
                        onPlus: () => controller.plusProduct(),
                        price: controller.product.price,
                        // decorationColor: Colors.red,
                      )),
                  const Divider(),
                  ListTile(
                    title: const Text(
                      'Total',
                      style: AppTheme.textBold,
                    ),
                    trailing: Obx(() => Text(
                          FormatterHelper.formatCurrency(controller.totalPrice),
                          style: AppTheme.textBold,
                        )),
                  ),
                  Center(
                    child: SizedBox(
                      width: context.widthTransformer(reducedBy: 10),
                      child: AppButton(
                        onPressed: () {
                          controller.addProductInShoppingCart();
                        },
                        label:
                            controller.alreadyAdded ? 'ATUALIZAR' : 'ADICIONAR',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
