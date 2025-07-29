import 'package:flutter_test/flutter_test.dart';
import 'package:list_assets/core/data/assets.dart';
import 'package:list_assets/core/data/crypto_asset.dart';
import 'package:list_assets/feature/list_assets_screen/domain/list_assets_interactor_impl.dart';
import 'package:mocktail/mocktail.dart';
import '../../mocks.dart';
import 'package:list_assets/core/util/format.dart';

void main() {
  late MockListAssetsRepository mockRepository;
  late ListAssetsInteractorImpl interactor;

  setUp(() {
    mockRepository = MockListAssetsRepository();
    interactor = ListAssetsInteractorImpl(listAssetsRepository: mockRepository);
  });

  test(
      'getListAssets returns list of CryptoAsset with formatted price and color',
      () async {
    final fakeDatum = Datum(
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
    final fakeAssets = Assets(timestamp: 123456789, data: [fakeDatum]);
    when(() => mockRepository.getAssets(limit: 15, offset: 0))
        .thenAnswer((_) async => fakeAssets);

    final result = await interactor.getListAssets(limit: 15, offset: 0);
    expect(result, isA<List<CryptoAsset>>());
    expect(result.length, 1);
    expect(result.first.datum, fakeDatum);
    expect(result.first.formattedPrice, formatCurrency('30000'));
    expect(result.first.color, isNotNull);
  });
}
