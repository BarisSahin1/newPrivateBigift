import 'dart:convert';
import 'package:bi_gift_app/model/user.dart';
import 'package:bi_gift_app/services/network_handler.dart';
import 'package:http/http.dart' as http;

class UserService {
  static void changeUserLoginStatus() {
    User.isLoggedIn = true;
  }

  static Future<void> userLogin(String email, String password) async {
    Map jsonData = {'email': email, 'password': password};
    //encode Map to JSON
    var body = json.encode(jsonData);
    //Http post request to login
    http.Response response = await http.post(
      Uri.parse('http://10.0.2.2:3000/auth/sign_in'),
      headers: {"Content-Type": "application/json"},
      body: body,
    );
    //Get response data as map
    Map data = jsonDecode(response.body);
    //Get token from response' header
    var accessToken = response.headers['access-token'];
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('a');
      NetworkHandler.storeToken(accessToken);
      print(User.isLoggedIn);
      changeUserLoginStatus();
      print(User.isLoggedIn);
    } else {
      print("Error");
    }
  }
}
