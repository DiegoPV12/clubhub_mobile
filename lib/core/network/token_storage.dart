import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _kJwtKey = 'jwt';

final _secure = FlutterSecureStorage(
  aOptions: const AndroidOptions(encryptedSharedPreferences: true),
  iOptions: const IOSOptions(accessibility: KeychainAccessibility.first_unlock),
);

class TokenStorage {
  Future<void> save(String jwt) => _secure.write(key: _kJwtKey, value: jwt);
  Future<String?> read() => _secure.read(key: _kJwtKey);
  Future<void> clear() => _secure.delete(key: _kJwtKey);
}

final tokenStorageProvider = Provider<TokenStorage>((_) => TokenStorage());
