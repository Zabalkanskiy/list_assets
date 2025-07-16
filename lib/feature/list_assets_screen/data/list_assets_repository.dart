import 'package:list_assets/core/data/assets.dart';

abstract class ListAssetsRepository {
  Future<Assets> getAssets({int limit = 15, int offset = 0});
}