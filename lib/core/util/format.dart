 import 'package:intl/intl.dart';

String formatCurrency(String price) {
  final number = double.tryParse(price) ?? 0.0;
  final formatted = NumberFormat.currency(
    locale: 'en_US', //
    // symbol: '\$',
    decimalDigits: 2,
    customPattern: '#,###.##', // Используем запятую как разделитель тысяч
  ).format(number);
  return '\$$formatted';
}