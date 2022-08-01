import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class NetworkHandler {
  static const String _baseUrl = 'http://10.0.2.2:3000/auth';
  //static final client = http.Client();
  static String? token;
  //Storage to keep token on disk as a secure
  static FlutterSecureStorage storage = FlutterSecureStorage();
  //NetworkHandler();

  static Future<void> storeToken(String? token) async {
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

  static Future<dynamic> get(String url, {String? param = null}) async {
    final response = await http.get(
      Uri.parse(_baseUrl + url),
    );

    var accessToken = response.headers['access-token'];
    if (response.statusCode == 200) {
      NetworkHandler.storeToken(accessToken);
      return json.decode(response.body);
    }
  }

  static Future<dynamic> post(String url, Map<dynamic, dynamic> body) async {
    var bodyJson = json.encode(body);

    final response = await http.post(
      Uri.parse("$_baseUrl$url"),
      headers: {"Content-Type": "application/json"},
      body: bodyJson,
    );
    var accessToken = response.headers['access-token'];
    return response;
  }

  static Future<dynamic> delete(String url) async {
    final response = await http.delete(Uri.parse("$_baseUrl$url"),
        headers: {"Content-Type": "application/json"});
  }
}
