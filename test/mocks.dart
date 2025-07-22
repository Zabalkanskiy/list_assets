import 'package:list_assets/core/api/crypto_api.dart';
import 'package:list_assets/core/data/assets.dart';
import 'package:list_assets/feature/list_assets_screen/domain/list_assets_interactor.dart';
import 'package:mocktail/mocktail.dart';

class MockCryptoApi extends Mock implements CryptoApi {}

class MockInteractor extends Mock implements ListAssetsInteractor {}