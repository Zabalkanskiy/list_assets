import 'package:flutter_test/flutter_test.dart';
import 'package:list_assets/core/data/crypto_asset.dart';
import 'package:list_assets/core/data/assets.dart';
import 'dart:ui';

void main() {
  test('CryptoAsset fields', () {
    final datum = Datum(
      id: 'bitcoin',
      rank: '1',
      symbol: 'BTC',
      name: 'Bitcoin',
      priceUsd: '30000',
      supply: '19000000',
      maxSupply: '21000000',
      marketCapUsd: '570000000000',
      volumeUsd24Hr: '10000000000',
      changePercent24Hr: '1.2',
      vwap24Hr: '29900',
      explorer: 'https://blockchain.info',
      tokens: null,
    );
    final asset = CryptoAsset(
      datum: datum,
      color: const Color(0xFF0000FF),
      formattedPrice: ' 30,000',
    );
    expect(asset.datum, datum);
    expect(asset.color, const Color(0xFF0000FF));
    expect(asset.formattedPrice, ' 30,000');
  });
}
