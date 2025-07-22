import 'package:injectable/injectable.dart';
import 'package:list_assets/core/data/assets.dart';
import 'package:list_assets/core/data/crypto_asset.dart';
import 'package:list_assets/core/util/format.dart';
import 'package:list_assets/core/util/generate_color.dart';
import 'package:list_assets/feature/list_assets_screen/data/list_assets_repository.dart';

import 'list_assets_interactor.dart';

@Injectable(as: ListAssetsInteractor)
class ListAssetsInteractorImpl implements ListAssetsInteractor {
  ListAssetsRepository listAssetsRepository;

  ListAssetsInteractorImpl({required this.listAssetsRepository});

  @override
  Future<List<CryptoAsset>> getListAssets({int limit = 15, int offset = 0}) async{
    final Assets assets = await listAssetsRepository.getAssets(limit: limit, offset:  offset);
    return assets.data.map((datum) {
      final color = GenerateColor.generateRandomColor();

      return CryptoAsset(
        datum: datum,
        color: color,
        formattedPrice: formatCurrency(datum.priceUsd),
      );
    }).toList();
  }
}