import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introducao_flutter/app/core/ui/app_appbar.dart';
import 'package:introducao_flutter/app/core/ui/app_button.dart';
import 'package:introducao_flutter/app/models/order_pix.dart';

class FinishedPage extends StatelessWidget {
  final OrderPix _orderPix = Get.arguments;
  FinishedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar(),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(),
                Image.asset(
                  'assets/images/logo_rounded.png',
                  width: context.widthTransformer(reducedBy: 70),
                  height: context.widthTransformer(reducedBy: 70),
                ),
                const Text(
                  'Pedido concluído.',
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'Clique abaixo para acessar o QRCode do PIX.',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: context.widthTransformer(reducedBy: 10),
                  child: AppButton(
                    onPressed: () {
                      Get.toNamed('/orders/pix', arguments: _orderPix);
                    },
                    label: 'PIX',
                    color: Colors.blue,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: context.widthTransformer(reducedBy: 10),
                  child: AppButton(
                    label: 'FECHAR',
                    onPressed: () {
                      Get.offAllNamed('/home');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
