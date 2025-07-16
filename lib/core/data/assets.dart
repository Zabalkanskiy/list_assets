import 'package:json_annotation/json_annotation.dart';

part 'assets.g.dart';

@JsonSerializable()
class Assets {
  final int timestamp;
  final List<Datum> data;

  Assets({
    required this.timestamp,
    required this.data,
  });

  factory Assets.fromJson(Map<String, dynamic> json) => _$AssetsFromJson(json);
  Map<String, dynamic> toJson() => _$AssetsToJson(this);
}

///переписал часть на nullable типы так как иногда не все поля от апишки приходят
@JsonSerializable()
class Datum {
  final String id;
  final String rank;
  final String symbol;
  final String name;
  final String? supply;
  final String? maxSupply;
  final String? marketCapUsd;
  final String? volumeUsd24Hr;
  final String priceUsd;
  final String? changePercent24Hr;
  final String? vwap24Hr;
  final String? explorer;
  final Map<String, List<String>>? tokens;

  Datum({
    required this.id,
    required this.rank,
    required this.symbol,
    required this.name,
    required this.supply,
    required this.maxSupply,
    required this.marketCapUsd,
    required this.volumeUsd24Hr,
    required this.priceUsd,
    required this.changePercent24Hr,
    required this.vwap24Hr,
    required this.explorer,
    required this.tokens,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
  Map<String, dynamic> toJson() => _$DatumToJson(this);

}