// lib/features/auth/data/auth_repository.dart
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/token_storage.dart';

class AuthTokens {
  final String jwt;
  const AuthTokens(this.jwt);
}

abstract interface class AuthRepository {
  Future<AuthTokens> login(String email, String password);
  Future<AuthTokens> register(String name, String email, String password);
}

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._dio, this._storage);
  final Dio _dio;
  final TokenStorage _storage;

  @override
  Future<AuthTokens> login(String email, String password) async {
    final resp = await _dio.post(
      '/auth/login',
      data: {'email': email, 'password': password},
    );
    final token = resp.data['token'] as String;
    await _storage.save(token);
    return AuthTokens(token);
  }

  @override
  Future<AuthTokens> register(
    String name,
    String email,
    String password,
  ) async {
    final resp = await _dio.post(
      '/auth/register',
      data: {'name': name, 'email': email, 'password': password},
    );
    final token = resp.data['token'] as String;
    await _storage.save(token);
    return AuthTokens(token);
  }
}

// Provider actualizado
final authRepoProvider = Provider<AuthRepository>((ref) {
  final dio = ref.watch(dioProvider);
  final storage = ref.watch(tokenStorageProvider);
  return AuthRepositoryImpl(dio, storage);
});
