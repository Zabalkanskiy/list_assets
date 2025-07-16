import 'package:list_assets/core/data/assets.dart';

abstract class ListAssetsInteractor {
  Future<List<Datum>> getListDatum({int limit = 15, int offset = 0});
}