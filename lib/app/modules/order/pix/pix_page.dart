import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:introducao_flutter/app/core/ui/app_appbar.dart';
import 'package:introducao_flutter/app/core/ui/app_button.dart';
import 'package:introducao_flutter/app/core/ui/formater_helper.dart';
import 'package:introducao_flutter/app/models/order_pix.dart';

class PixPage extends StatelessWidget {
  final OrderPix _orderPix = Get.arguments;
  PixPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var qrCode = Uri.parse(_orderPix.image).data;
    return Scaffold(
      appBar: AppAppbar(),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Valor a pagar',
                  style: context.textTheme.headline4,
                ),
                Text(
                  FormatterHelper.formatCurrency(_orderPix.totalValue),
                  style: context.textTheme.headline4?.copyWith(
                    color: context.theme.primaryColorDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Image.memory(
                  qrCode!.contentAsBytes(),
                  width: context.widthTransformer(reducedBy: 50),
                  height: context.widthTransformer(reducedBy: 50),
                ),
                TextButton(
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: _orderPix.code));
                    Get.rawSnackbar(
                      message: 'Código PIX copiado',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                  child: const Text('Clique aqui para copiar o Pix'),
                ),
                const Spacer(),
                SizedBox(
                  width: context.widthTransformer(reducedBy: 10),
                  child: AppButton(
                    label: 'Paguei.',
                    onPressed: () {
                      Get.offAllNamed('/home');
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
