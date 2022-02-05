import 'package:intl/intl.dart';

class FormatterHelper {
  FormatterHelper._();
  static final _currencyFormat = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: r'R$',
  );
  static String formatCurrency(double value) {
    return _currencyFormat.format(value);
  }
}
