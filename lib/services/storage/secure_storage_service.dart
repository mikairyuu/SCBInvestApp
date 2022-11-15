import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final secureStorageProvider = Provider((ref) {
  return SecureStorageService();
});

class SecureStorageService {
  final FlutterSecureStorage _prefs = const FlutterSecureStorage();

  SecureStorageService();

  Future<void> setString(String key, String value) async {
    await _prefs.write(key: key, value: value);
  }

  Future<String?> getString(String key) {
    return _prefs.read(key: key);
  }

  Future<void> clear() async {
    await _prefs.deleteAll();
  }
}

const keyToken = 'token';
