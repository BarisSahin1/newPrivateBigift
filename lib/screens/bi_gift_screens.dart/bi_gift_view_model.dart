import 'package:bi_gift_app/model/bi_gift_models/bi_gift_dropdown.dart';
import 'package:bi_gift_app/services/api_services.dart/bi_gift_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class BiGiftViewModel with ChangeNotifier {
  BiGiftDropdownModel? biGiftModel;

  Future<bool>? getBiGiftModel() async {
    biGiftModel = await BiGiftService.getDropdownsListItems();
    if (biGiftModel != null) {
      return true;
    } else {
      return false;
    }
  }

  List? getUserList() {
    return biGiftModel?.userNameList;
  }

  List? getHashtagList() {
    return biGiftModel?.hashtagList;
  }

  void userSetSelectedItem(String newVal) {
    biGiftModel?.userSelectedValue = newVal;
    notifyListeners();
  }

  void setHashtagSelectedItem(String newVal) {
    biGiftModel?.hashtagSelectedValue = newVal;
    notifyListeners();
  }

  String? get getUserSelectedVal => biGiftModel!.userSelectedValue;
  String? get getHashtagSelectedVal => biGiftModel!.hashtagSelectedValue;
  //Point provider list
  List<String> pointList = ["+10", "+20", "+30", "+40", "+50", "+60", "+70"];
  String? pointSelectedValue = "+10";

  List<String> getPointList() {
    return pointList;
  }

  void pointSetSelectedItem(String newVal) {
    pointSelectedValue = newVal;
    notifyListeners();
  }

  String? get getPointSelectedValue => pointSelectedValue;

  Future<void> createGift(String description, int userId, int hashtagId,
      int recipientId, String bonusPoint) async {
    int parsedBonusPoint = int.parse(bonusPoint);

    Map body = {
      "gift": {
        "hashtag_id": hashtagId,
        "description": description,
        "bonusPoint": parsedBonusPoint,
        "user_id": userId,
        "recipient_id": recipientId,
      }
    };
    print(body);
    Response response = await BiGiftService.createGift(body);
  }
}
