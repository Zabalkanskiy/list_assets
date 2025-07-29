import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:list_assets/feature/list_assets_screen/presentation/ui/list_assets_screen.dart';
import 'package:list_assets/feature/list_assets_screen/presentation/bloc/list_assets_bloc.dart';
import 'package:list_assets/core/data/crypto_asset.dart';
import 'package:list_assets/core/data/assets.dart';
import 'package:list_assets/core/util/format.dart';
import 'package:list_assets/core/util/generate_color.dart';
import 'package:list_assets/feature/list_assets_screen/presentation/ui/crypto_item.dart';

class MockListAssetsBloc extends Mock implements ListAssetsBloc {}

void main() {
  late ListAssetsBloc bloc;

  setUp(() {
    bloc = MockListAssetsBloc();
    // Мокаем stream для BlocBuilder
    when(() => bloc.stream).thenAnswer((_) => Stream<ListAssetsState>.empty());
  });

  Widget makeTestable(Widget child) => MaterialApp(
      home: BlocProvider<ListAssetsBloc>.value(value: bloc, child: child));

  final fakeAssets = [
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

  testWidgets('shows loading indicator for CryptoInitial', (tester) async {
    when(() => bloc.state).thenReturn(CryptoInitial());
    await tester.pumpWidget(makeTestable(const ListAssetsScreen()));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('shows loading indicator for CryptoLoading', (tester) async {
    when(() => bloc.state).thenReturn(CryptoLoading());
    await tester.pumpWidget(makeTestable(const ListAssetsScreen()));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('shows error text for CryptoError', (tester) async {
    when(() => bloc.state).thenReturn(const CryptoError('error'));
    await tester.pumpWidget(makeTestable(const ListAssetsScreen()));
    expect(find.textContaining('Error'), findsOneWidget);
  });

  testWidgets('shows list for CryptoLoaded', (tester) async {
    when(() => bloc.state)
        .thenReturn(CryptoLoaded(assets: fakeAssets, hasReachedMax: true));
    await tester.pumpWidget(makeTestable(const ListAssetsScreen()));
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(CryptoAsset),
        findsNothing); // CryptoItem is used, not CryptoAsset
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets('shows CryptoItem widgets for each asset in CryptoLoaded',
      (tester) async {
    when(() => bloc.state)
        .thenReturn(CryptoLoaded(assets: fakeAssets, hasReachedMax: true));
    await tester.pumpWidget(makeTestable(const ListAssetsScreen()));
    // Проверяем, что отображается CryptoItem
    expect(find.byType(CryptoItem), findsNWidgets(fakeAssets.length));
    // Проверяем, что отображается символ
    expect(find.text('BTC'), findsOneWidget);
    // Проверяем, что отображается цена
    expect(find.text(formatCurrency('30000')), findsOneWidget);
  });
}
