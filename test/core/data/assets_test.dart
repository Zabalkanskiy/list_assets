import 'package:flutter_test/flutter_test.dart';
import 'package:list_assets/core/data/assets.dart';

void main() {
  test('Assets toJson/fromJson', () {
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
    final assets = Assets(timestamp: 123456789, data: [datum]);
    Map<String, dynamic> json = assets.toJson();
    final fromJson = Assets.fromJson(json);
    expect(fromJson.timestamp, assets.timestamp);
    expect(fromJson.data.first.id, datum.id);
    expect(fromJson.data.first.symbol, datum.symbol);
  });
}
