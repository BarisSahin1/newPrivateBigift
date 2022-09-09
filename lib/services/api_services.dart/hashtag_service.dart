import 'package:bi_gift_app/model/hashtag_models/hashtag_model.dart';
import 'package:bi_gift_app/services/api_services.dart/base_api_service.dart';

class HashtagService {
  static Future<Hashtag> getHashtagNameList() async {
    return await ApiService.get("/hashtags_list", Hashtag());
  }
}
