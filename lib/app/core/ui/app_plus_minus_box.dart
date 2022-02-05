import 'package:flutter/material.dart';
import 'package:introducao_flutter/app/core/ui/app_rouded_button.dart';
import 'package:introducao_flutter/app/core/ui/formater_helper.dart';

class AppPlusMinusBox extends StatelessWidget {
  final bool elevated;
  final Color? decorationColor;
  final String? label;
  final int quantity;
  final double price;
  final VoidCallback onPlus;
  final VoidCallback onMinus;
  final bool calculateTotal;
  const AppPlusMinusBox({
    Key? key,
    this.elevated = false,
    this.decorationColor,
    this.label,
    required this.quantity,
    required this.price,
    required this.onPlus,
    required this.onMinus,
    this.calculateTotal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevated ? 5 : 0,
      borderRadius: BorderRadius.circular(20),
      shadowColor: Colors.black26,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: decorationColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Visibility(
              visible: label != null,
              child: Text(
                label ?? '',
                style: TextStyle(fontSize: 15),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppRoudedButton(
                  label: '-',
                  onPressed: onMinus,
                ),
                Text('$quantity'),
                AppRoudedButton(
                  label: '+',
                  onPressed: onPlus,
                ),
              ],
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 10,
              ),
              constraints: const BoxConstraints(minWidth: 70),
              child: Text(FormatterHelper.formatCurrency(
                  calculateTotal ? price * quantity : price)),
            ),
          ],
        ),
      ),
    );
  }
}
