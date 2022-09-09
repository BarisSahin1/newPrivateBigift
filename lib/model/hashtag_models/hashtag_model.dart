import 'package:bi_gift_app/model/global_models/base_model.dart';

class Hashtag extends BaseModel {
  List? hashtagNameList;

  Hashtag({this.hashtagNameList});

  @override
  fromJson(Map<String, dynamic> json) {
    hashtagNameList = json['hashtag_list'];
    return Hashtag(hashtagNameList: hashtagNameList);
  }
}
