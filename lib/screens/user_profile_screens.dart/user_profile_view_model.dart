import 'package:bi_gift_app/model/login_models/login_user_model.dart';
import 'package:bi_gift_app/services/api_services.dart/base_api_service.dart';
import 'package:flutter/cupertino.dart';

class UserProfileViewModel with ChangeNotifier {
  //final userProvider = Provider.of<LoginViewModel>(context);

  Future<void> userUpdate(
    LoginUserModel currentUser,
    String nickname,
    String name,
    String email,
    String? accessToken,
    String? expiry,
    String? client,
  ) async {
    Map userUpdateJsonData = {
      "access-token": accessToken,
      "expiry": expiry,
      "client": client,
      "uid": email,
      "nickname": nickname,
      "name": name,
      "email": email,
    };

    await ApiService.put(userUpdateJsonData);
    currentUser.email = email;
    currentUser.nickname = nickname;
    currentUser.name = name;
    notifyListeners();
  }

  String userFirstLetters(String? name) {
    List<String> names = name!.split(" ");
    String firstName = names[0][0];
    String lastName = names[1][0];
    String cmp = "$firstName.$lastName";
    return cmp;
  }

  static deleteUser(LoginUserModel? user) {
    user = null;
  }
}
