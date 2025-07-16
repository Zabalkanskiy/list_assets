import 'package:dio/dio.dart';

class CreateDio {

  static Dio createDio() {
    return Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ))
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ));
  }
}