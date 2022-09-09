import 'package:bi_gift_app/model/global_models/base_model.dart';

class BiGiftDropdownModel extends BaseModel {
  List? hashtagList;
  List? userNameList;
  String? userSelectedValue;
  String? hashtagSelectedValue;

  BiGiftDropdownModel(
      {this.hashtagList,
      this.userNameList,
      this.userSelectedValue,
      this.hashtagSelectedValue});

  @override
  fromJson(Map<String, dynamic> json) {
    hashtagList = json['hashtags_list'];
    userNameList = json['users_name_list'];
    userSelectedValue = userNameList![0];
    hashtagSelectedValue = hashtagList![0];
    return BiGiftDropdownModel(
        hashtagList: hashtagList,
        userNameList: userNameList,
        userSelectedValue: userSelectedValue,
        hashtagSelectedValue: hashtagSelectedValue);
  }
}
