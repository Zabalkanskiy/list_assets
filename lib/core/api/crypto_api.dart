import 'package:dio/dio.dart';
import 'package:list_assets/core/data/assets.dart';
import 'package:retrofit/retrofit.dart';

part 'crypto_api.g.dart';

const String _baseUrl = 'https://rest.coincap.io/v3';

@RestApi(baseUrl: _baseUrl)
abstract class CryptoApi {
  factory CryptoApi(Dio dio, {String baseUrl}) = _CryptoApi;

  @GET('/assets')
  Future<Assets> getAssets({
    @Query('apiKey') required String apiKey,
    @Query('limit') int limit = 15,
    @Query('offset') int offset = 0,
  });
}