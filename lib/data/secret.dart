/*
 * Filename: c:\dev\wip\vsm\svsm\lib\data\secret.dart
 * Path: c:\dev\wip\vsm\svsm\lib\data
 * Created Date: Tuesday, November 22nd 2022, 11:16:48 am
 * Author: Vikas K Solegaonkar
 * 
 * Copyright (c) 2022 Vikas K Solegaonkar
 */
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Save secrets for the system.
class SecretManager {
  static const _storage = FlutterSecureStorage();
  static Map<String, String> _allSecrets = {};

  /// Initialize the secret manager.
  static Future<void> init() async {
    _allSecrets = await _storage.readAll(
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
  }

  /// Add a new secret
  static Future<void> addSecret({
    required String key,
    required String value,
  }) async {
    await _storage.write(
      key: key,
      value: value,
      iOptions: _getIOSOptions(),
      aOptions: _getAndroidOptions(),
    );
    _allSecrets[key] = value;
  }

  /// Get the value of a stored secret.
  static String? getSecret({required String key}) {
    return _allSecrets[key];
  }

  /*
   * At this point, we do not expect any IOS users. So ignore this.
   * Check https://pub.dev/packages/flutter_secure_storage/example 
   * for expected iOS options.
   */
  static IOSOptions _getIOSOptions() => const IOSOptions();

  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
        // sharedPreferencesName: 'Test2',
        // preferencesKeyPrefix: 'Test'
      );
}
