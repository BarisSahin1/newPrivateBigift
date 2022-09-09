import 'package:flutter/material.dart';

class DashboardViewModel with ChangeNotifier {
  bool isVisible;
  bool flag;
  DashboardViewModel({
    this.isVisible = true,
    this.flag = true,
  });
  void changeFlagFalse() {
    flag = false;
    notifyListeners();
  }

  void changeFlagTrue() {
    flag = true;
    notifyListeners();
  }

  void changeFalseVisible() {
    if (isVisible) {
      isVisible = false;
    }
    notifyListeners();
  }

  void changeTrueVisible() {
    if (!isVisible) {
      isVisible = true;
    }
    notifyListeners();
  }
}
