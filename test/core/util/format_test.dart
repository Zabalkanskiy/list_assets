import 'package:flutter_test/flutter_test.dart';
import 'package:list_assets/core/util/format.dart';

void main() {
  test('formatCurrency formats price correctly', () {
    expect(formatCurrency('1234.56'), '\$1,234.56');
    expect(formatCurrency('0'), '\$0.00');
    expect(formatCurrency(''), '\$0.00');
    expect(formatCurrency('1000000'), '\$1,000,000.00');
  });
}
