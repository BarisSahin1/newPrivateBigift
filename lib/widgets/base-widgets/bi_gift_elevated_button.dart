import 'package:bi_gift_app/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';

class AppElevatedBUtton extends StatelessWidget {
  VoidCallback onPressed;
  Color primaryColor;
  Color onPrimaryColor = AppStyles.appStyleObject.primaryColor;
  Widget child;

  AppElevatedBUtton({
    required this.onPressed,
    required this.onPrimaryColor,
    required this.primaryColor,
    required this.child,
  });

  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: primaryColor,
        onPrimary: onPrimaryColor,
      ),
      child: child,
    );
  }
}
