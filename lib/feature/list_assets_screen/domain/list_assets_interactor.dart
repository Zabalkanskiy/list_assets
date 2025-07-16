import 'package:list_assets/core/data/assets.dart';
import 'package:list_assets/core/data/crypto_asset.dart';

abstract class ListAssetsInteractor {
  Future<List<CryptoAsset>> getListAssets({int limit = 15, int offset = 0});
}