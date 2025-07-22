import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:list_assets/feature/list_assets_screen/presentation/bloc/list_assets_bloc.dart';
import 'package:list_assets/core/data/crypto_asset.dart';
import 'package:list_assets/core/data/assets.dart';
import 'package:list_assets/core/util/format.dart';
import 'package:list_assets/core/util/generate_color.dart';
import 'package:mocktail/mocktail.dart';
import 'mocks.dart';

void main() {
  late MockInteractor mockInteractor;
  late ListAssetsBloc bloc;

  setUp(() {
    mockInteractor = MockInteractor();
    bloc = ListAssetsBloc(listAssetsInteractor: mockInteractor);
  });

  final fakeAssets = <CryptoAsset>[
    CryptoAsset(
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
      color: GenerateColor.generateRandomColor(),
      formattedPrice: formatCurrency('30000'),
    ),
  ];

  blocTest<ListAssetsBloc, ListAssetsState>(
    'emits loading then loaded with items',
    setUp: () => when(() => mockInteractor.getListAssets(limit: 15, offset: 0))
        .thenAnswer((_) async => fakeAssets), // ← async stub
    build: () => bloc,
    act: (_) => bloc.add(LoadCryptoEvent()),
    expect: () => [
      CryptoLoading(),
      CryptoLoaded(assets: fakeAssets, hasReachedMax: true), // ← corrected flag
    ],
  );

  blocTest<ListAssetsBloc, ListAssetsState>(
    'load more appends items',
    setUp: () {
      bloc.emit(CryptoLoaded(assets: fakeAssets, hasReachedMax: false));
      // 1. Стабим первый запрос
      when(() => mockInteractor.getListAssets(limit: 15, offset: 0))
          .thenAnswer((_) async => fakeAssets);

      when(() => mockInteractor.getListAssets(limit: 15, offset: 15))
          .thenAnswer((_) async => fakeAssets); // ← async stub
    },
    build: () => bloc,
    act: (_) => bloc.add(LoadMoreCryptoEvent()),
    expect: () => [
      CryptoLoaded(assets: [...fakeAssets, ...fakeAssets], hasReachedMax: true),
    ],
  );
}