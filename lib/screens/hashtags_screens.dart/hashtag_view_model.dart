import 'package:bi_gift_app/model/hashtag_models/hashtag_model.dart';
import 'package:bi_gift_app/services/api_services.dart/hashtag_service.dart';
import 'package:flutter/cupertino.dart';

class HashtagViewModel with ChangeNotifier {
  Hashtag? hashtagObject;
  HashtagViewModel() {
    getHashtagList();
  }
  getHashtagList() async {
    hashtagObject = await HashtagService.getHashtagNameList();
    print(hashtagObject!.hashtagNameList);
  }

  List? get gethashtagList => hashtagObject!.hashtagNameList;
}
