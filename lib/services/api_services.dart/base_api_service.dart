import 'dart:convert';

import 'package:bi_gift_app/model/global_models/base_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseApiUrl = 'http://10.0.2.2:3000/auth';

  static Future get<T extends BaseModel>(String url, T model) async {
    final response = await http.get(
      Uri.parse(_baseApiUrl + url),
    );
    return model.fromJson(jsonDecode(response.body));
  }

  static Future post<T extends BaseModel>(
      String url, Map<dynamic, dynamic> body, T model) async {
    //Encode json body
    dynamic bodyJsonParam = json.encode(body);

    final response = await http.post(
      Uri.parse("$_baseApiUrl$url"),
      headers: {"Content-Type": "application/json"},
      body: bodyJsonParam,
    );

    if (response.statusCode == 200) {
      return model.fromJson(jsonDecode(response.body));
    }
  }

  static Future<void> put(Map<dynamic, dynamic> body) async {
    var bodyJson = json.encode(body);
    await http.put(
      Uri.parse(_baseApiUrl),
      headers: {"Content-Type": "application/json"},
      body: bodyJson,
    );
  }
}
