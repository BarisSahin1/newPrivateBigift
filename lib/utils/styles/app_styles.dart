import 'package:flutter/material.dart';

class AppStyles {
  static AppStyles appStyleObject = AppStyles();

  TextStyle smallTextStyle = TextStyle(fontSize: 12);
  TextStyle mediumTextStyle = TextStyle(fontSize: 15);
  TextStyle largeTextStyle = TextStyle(fontSize: 18);

  Color primaryColor = Color(0xFF272343);
  Color secondaryColor = Color(0xffBAE8E8);
  Color thirdColor = Color(0xffE3F6F5);
  Color backgroundColor = Colors.white;

  AppStyles get appTextStylesObject {
    return appStyleObject;
  }
}
