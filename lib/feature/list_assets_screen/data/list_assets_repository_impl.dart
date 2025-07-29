import 'package:injectable/injectable.dart';
import 'package:list_assets/core/api/crypto_api.dart';
import 'package:list_assets/core/data/assets.dart';

import 'list_assets_repository.dart';

@Injectable(as: ListAssetsRepository)
class ListAssetsRepositoryImpl implements ListAssetsRepository {
  static const String _apiKey =
      'd35b2f2e913e668815eb8dcd6d3da7595db142d2c2f9c40a17b1b0e1eec22532';

  final CryptoApi _api;

  ListAssetsRepositoryImpl(this._api);
  @override
  Future<Assets> getAssets({int limit = 15, int offset = 0}) async {
    return _api.getAssets(apiKey: _apiKey, limit: limit, offset: offset);
  }
}
