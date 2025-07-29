import 'package:flutter_test/flutter_test.dart';
import 'package:list_assets/core/util/generate_color.dart';
import 'dart:ui';

void main() {
  test('generateRandomColor returns Color with alpha 0.1', () {
    final color = GenerateColor.generateRandomColor();
    expect(color, isA<Color>());
    expect(color.a, closeTo(0.1, 0.01));
    expect((color.r).round(), inInclusiveRange(0, 255));
    expect((color.g).round(), inInclusiveRange(0, 255));
    expect((color.b).round(), inInclusiveRange(0, 255));
  });
}
