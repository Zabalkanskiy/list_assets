import 'dart:ui';

import 'assets.dart';

class CryptoAsset {
  final Datum datum;
  final Color color;
  final String formattedPrice;

  CryptoAsset({
    required this.datum,
    required this.color,
    required this.formattedPrice,
  });
}