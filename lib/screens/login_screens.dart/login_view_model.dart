import 'dart:convert';
import 'package:bi_gift_app/model/login_models/login_user_model.dart';
import 'package:bi_gift_app/services/api_services.dart/login_service.dart';
import 'package:bi_gift_app/services/app_services.dart/local_storage_service.dart';
import 'package:bi_gift_app/utils/global/global_key.dart';
import 'package:bi_gift_app/utils/enums/provider_state.dart';
import 'package:bi_gift_app/widgets/base-widgets/snackbar_message_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class LoginViewModel with ChangeNotifier {
  ProviderState providerState;
  LoginUserModel? currentUser;
  String? token;
  bool isLoading = false;
  String email;
  String password;
  String? imageUrl;
  String mailRegex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  LoginViewModel({
    this.email = "",
    this.password = "",
    this.providerState = ProviderState.Done,
  });

  Future<void> login(String email, String password) async {
    providerState = ProviderState.Loading;
    Map loginBodyJsonData = {"email": email, "password": password};
    Response response = await LoginService.loginResponse(loginBodyJsonData);
    currentUser = LoginUserModel.fromJson(jsonDecode(response.body));
    currentUser!.token = response.headers["access-token"];
    await setUserImage(currentUser?.id);
    await LocalStorageService.storeToken(currentUser?.token);
    providerState = ProviderState.Done;
    notifyListeners();
  }

  Future<void> setUserImage(int? id) async {
    Map imageJsonData = {"id": id};
    Response responseImage =
        await LoginService.userImageResponse(imageJsonData);
    var jsonResponseImage = jsonDecode(responseImage.body);
    var imageUrl = jsonResponseImage['image_url'];
    currentUser!.imageUrl = imageUrl;

    notifyListeners();
  }

  Future<bool> loginMailRegexCheck(String email) async {
    if (RegExp(mailRegex).hasMatch(email)) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> loginErrorCheck(String email, String password) async {
    if (await loginMailRegexCheck(email)) {
      setLoadingIndicator();

      await login(email, password);
      bool isUserExist = await LocalStorageService.isTokenExist();
      if (isUserExist) {
        ShowSnackBar.ShowMessages(
            context: GlobalVariable.navState.currentContext,
            message: "Başarıyla giriş yaptınız.",
            isSuccesful: true);
        return true;
      } else {
        ShowSnackBar.ShowMessages(
            context: GlobalVariable.navState.currentContext,
            message:
                "E-postanız veya şifreniz doğru değil. Tekrar deneyin veya şifrenizi sıfırlayın.",
            isSuccesful: false);
        return false;
      }
    } else {
      ShowSnackBar.ShowMessages(
          context: GlobalVariable.navState.currentContext,
          message: "Lütfen mail formatınızı kontrol ediniz.",
          isSuccesful: false);
      return false;
    }
  }

  void setLoadingIndicator() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
