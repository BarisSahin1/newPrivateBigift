import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageService with ChangeNotifier {
  static FlutterSecureStorage storage = FlutterSecureStorage();

  static storeToken(String? token) async {
    await storage.write(key: 'Token', value: token);
  }

  static Future<String?>? getToken() {
    return storage.read(key: 'Token');
  }

  static Future<void> deleteToken() async {
    await storage.delete(key: 'Token');
  }

  static Future<bool> isTokenExist() async {
    if (await getToken() != null) {
      return true;
    } else {
      return false;
    }
  }
}
