import 'package:bi_gift_app/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:bi_gift_app/extensions/media_query_extension.dart';

class AppTextField extends StatelessWidget {
  IconData? icon;
  String? labelText;
  String? hintText;
  Color? backgroundColor = AppStyles.appStyleObject.backgroundColor;
  TextEditingController? controller;
  TextInputType? inputType;
  bool obscureText;
  int? lengthLimitingTextInput;

  AppTextField({
    this.icon,
    this.hintText,
    this.labelText,
    this.backgroundColor,
    this.controller,
    this.inputType,
    this.obscureText = false,
    this.lengthLimitingTextInput,
  });

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.widthPercentile * 4),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            icon,
            color: AppStyles.appStyleObject.primaryColor,
            size: 22,
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: AppStyles.appStyleObject.primaryColor,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 18,
            color: AppStyles.appStyleObject.primaryColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 2,
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 2,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
