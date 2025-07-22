import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:list_assets/core/api/crypto_api.dart';

@module
abstract class RegisterModule {
  @singleton
  Dio dio() => Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    },))
    ..interceptors.add(LogInterceptor(
      request: true,
      responseBody: true,
      requestBody: true,
      requestHeader: true,
    ));

  @singleton
  CryptoApi api(Dio dio) => CryptoApi(dio);


}