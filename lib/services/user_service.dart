import 'dart:convert';
import 'package:bi_gift_app/model/user.dart';
import 'package:bi_gift_app/services/network_handler.dart';
import 'package:http/http.dart' as http;

class UserService {
  static Future<void> changeUserLoginStatus() async {
    User.isLoggedIn = true;
  }

  static Future<int> userLogin(String email, String password) async {
    Map jsonData = {'email': email, 'password': password};
    //encode Map to JSON
    var body = json.encode(jsonData);
    //Http post request to login
    http.Response response = await http.post(
      Uri.parse('http://10.0.2.2:3000/auth/sign_in'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    Map data = jsonDecode(response.body);
    var accessToken = response.headers['access-token'];

    if (response.statusCode == 200) {
      NetworkHandler.storeToken(accessToken);
      print(data);
      print(response.statusCode);
      print(accessToken);
      print(NetworkHandler.isLoggedIn);
    } else {
      print("Error");
    }
    return response.statusCode;
  }
}
