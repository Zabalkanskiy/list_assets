import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:list_assets/feature/list_assets_screen/presentation/ui/crypto_item.dart';
import 'package:list_assets/core/data/crypto_asset.dart';
import 'package:list_assets/core/data/assets.dart';
import 'package:list_assets/core/util/format.dart';

void main() {
  testWidgets('CryptoItem displays symbol and formatted price', (tester) async {
    final asset = CryptoAsset(
      datum: Datum(
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
      ),
      color: Colors.red,
      formattedPrice: formatCurrency('30000'),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CryptoItem(asset: asset),
        ),
      ),
    );

    expect(find.text('BTC'), findsOneWidget);
    expect(find.text(formatCurrency('30000')), findsOneWidget);
    // Проверяем, что контейнер с цветом есть
    final container = tester.widget<Container>(find.byType(Container).at(1));
    final decoration = container.decoration as BoxDecoration;
    expect(decoration.color, Colors.red);
  });
} 