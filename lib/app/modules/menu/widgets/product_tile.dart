import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introducao_flutter/app/core/ui/app_theme.dart';
import 'package:introducao_flutter/app/core/ui/formater_helper.dart';
import 'package:introducao_flutter/app/models/product_model.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;
  const ProductTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/product_detail', arguments: product);
      },
      child: Container(
        color: Colors.blue,
        margin: const EdgeInsets.all(10),
        height: 80,
        child: Row(
          children: [
            Container(
              width: 80,
              decoration: BoxDecoration(
                // color: Colors.black,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                image: DecorationImage(
                    image: NetworkImage(
                        'http://dartweek.academiadoflutter.com.br/images${product.image}'),
                    fit: BoxFit.cover),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '${product.name}',
                      style: AppTheme.textBold,
                    ),
                    Text(FormatterHelper.formatCurrency(product.price)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
