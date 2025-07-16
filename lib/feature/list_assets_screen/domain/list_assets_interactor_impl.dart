import 'package:list_assets/core/data/assets.dart';
import 'package:list_assets/feature/list_assets_screen/data/list_assets_repository.dart';

import 'list_assets_interactor.dart';

class ListAssetsInteractorImpl implements ListAssetsInteractor {
  ListAssetsRepository listAssetsRepository;

  ListAssetsInteractorImpl({required this.listAssetsRepository});

  @override
  Future<List<Datum>> getListDatum({int limit = 15, int offset = 0}) async {
    final Assets assets = await listAssetsRepository.getAssets(limit: limit, offset:  offset);
    return assets.data;
  }
}