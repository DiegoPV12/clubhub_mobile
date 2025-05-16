import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants.dart';
import 'token_storage.dart';

/// —— Interceptor que añade el JWT ——
class JwtInterceptor extends Interceptor {
  JwtInterceptor(this.ref);
  final Ref ref; // ⟵  usa Ref

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await ref.read(tokenStorageProvider).read();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}

/// —— Provider global de Dio ——
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConst.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      contentType: Headers.jsonContentType,
    ),
  );

  dio.interceptors.addAll([
    JwtInterceptor(ref), // ⟵  pasamos ref
    PrettyDioLogger(requestBody: true, responseBody: true),
  ]);

  // Aceptar certificado self-signed en DEV
  (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
    final client = HttpClient();
    client.badCertificateCallback = (cert, host, port) => host == '10.0.2.2';
    return client;
  };

  return dio;
});
