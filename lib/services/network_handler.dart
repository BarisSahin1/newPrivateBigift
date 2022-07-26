import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class NetworkHandler {
  static String? token;
  static bool isLoggedIn = false;
  static final storage = FlutterSecureStorage();

  static void storeToken(String? token) async {
    await storage.write(key: 'Token', value: token);
  }

  static Future<String?> getToken() {
    return storage.read(key: 'Token');
  }
}
