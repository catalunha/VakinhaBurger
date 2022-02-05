import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introducao_flutter/app/core/ui/app_appbar.dart';
import 'package:introducao_flutter/app/core/ui/app_button.dart';
import 'package:introducao_flutter/app/core/ui/app_plus_minus_box.dart';
import 'package:introducao_flutter/app/core/ui/formater_helper.dart';
import 'package:introducao_flutter/app/modules/order/shoppinp_cart/shoppinp_cart_controller.dart';
import 'package:validatorless/validatorless.dart';

class ShoppingCartPage extends GetView<ShoppingCartController> {
  final formKey = GlobalKey<FormState>();
  ShoppingCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: IntrinsicHeight(
                child: Form(
                  key: formKey,
                  child: Visibility(
                    visible: controller.productList.isNotEmpty,
                    replacement: const Center(
                      child: Text('Carrinho vazio'),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text(
                                'Carrinho',
                                style: context.textTheme.headline6?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: context.theme.primaryColorDark,
                                ),
                              ),
                              IconButton(
                                onPressed: () => controller.clear(),
                                icon: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Obx(() => Column(
                            children: controller.productList
                                .map(
                                  (bag) => Container(
                                    margin: const EdgeInsets.all(10),
                                    child: AppPlusMinusBox(
                                      label: bag.product.name,
                                      calculateTotal: true,
                                      elevated: true,
                                      decorationColor: Colors.white,
                                      quantity: bag.quantity,
                                      price: bag.product.price,
                                      onPlus: () =>
                                          controller.addQuantityInProduct(bag),
                                      onMinus: () => controller
                                          .subtractQuantityInProduct(bag),
                                    ),
                                  ),
                                )
                                .toList())),
                        Container(
                          color: Colors.black12,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total do pedido',
                                style: context.textTheme.headline6
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              Obx(() => Text(
                                    FormatterHelper.formatCurrency(
                                        controller.totalValue),
                                    style: context.textTheme.headline6
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        ),
                        const Divider(),
                        const _AddressField(),
                        const Divider(),
                        const _CpfField(),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: SizedBox(
                            width: context.widthTransformer(reducedBy: 10),
                            child: AppButton(
                              label: 'FINALIZAR',
                              onPressed: () {
                                final formValid =
                                    formKey.currentState?.validate() ?? false;
                                if (formValid) {
                                  controller.createOrder();
                                }
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AddressField extends GetView<ShoppingCartController> {
  const _AddressField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
            child: Text(
              'Endereço de entrega',
              overflow: TextOverflow.ellipsis,
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              controller.address = value;
            },
            validator: Validatorless.required('Endereço obrigatório.'),
            decoration: const InputDecoration(
                hintText: 'Informe o endereço completo',
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey))),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class _CpfField extends GetView<ShoppingCartController> {
  const _CpfField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 35,
            child: Text(
              'Informe o CPF',
              overflow: TextOverflow.ellipsis,
            ),
          ),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              controller.cpf = value;
            },
            validator: Validatorless.multiple([
              Validatorless.required('CPF obrigatório.'),
              Validatorless.cpf('CPF inválido.')
            ]),
            decoration: const InputDecoration(
                hintText: 'Use apenas digitos',
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey))),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
