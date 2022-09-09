import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class LoginService {
  static Future<Response> loginResponse(Map<dynamic, dynamic> body) async {
    String url = "/sign_in";
    Response response = await http.post(
      Uri.parse("http://10.0.2.2:3000/auth/sign_in"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      return response;
    } else {
      return response;
    }
  }

  static Future<Response> userImageResponse(Map<dynamic, dynamic> body) async {
    Response responseImage = await http.post(
      headers: {"Content-Type": "application/json"},
      Uri.parse("http://10.0.2.2:3000/auth/image"),
      body: jsonEncode(body),
    );
    if (responseImage.statusCode == 200) {
      return responseImage;
    } else {
      return responseImage;
    }
  }
}
