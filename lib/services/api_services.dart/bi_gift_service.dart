import 'dart:convert';

import 'package:bi_gift_app/model/bi_gift_models/bi_gift_dropdown.dart';
import 'package:bi_gift_app/services/api_services.dart/base_api_service.dart';
import 'package:http/http.dart' as http;

class BiGiftService {
  static Future<BiGiftDropdownModel>? getDropdownsListItems() async {
    String url = "/gift_lists";
    return await ApiService.get(url, BiGiftDropdownModel());
  }

  static Future<http.Response> createGift(Map<dynamic, dynamic> body) async {
    String url = "/gifts";
    print(jsonEncode(body));
    return await http.post(
      Uri.parse("http://10.0.2.2:3000/gifts"),
      body: jsonEncode(body),
      headers: {"Content-Type": "application/json"},
    );
  }
}
