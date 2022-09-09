import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:bi_gift_app/extensions/media_query_extension.dart';

class ShowSnackBar {
  static Future ShowMessages(
      {BuildContext? context,
      String? message,
      bool isSuccesful = false,
      int duration = 1}) async {
    return ScaffoldMessenger.of(context!)
        .showSnackBar(
          SnackBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            duration: Duration(seconds: duration),
            behavior: SnackBarBehavior.floating,
            content: Container(
              padding: context.paddingMedium,
              height: context.heightPercentile * 8,
              decoration: BoxDecoration(
                color: isSuccesful ? Colors.green : Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: AutoSizeText(
                message!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                //overflow: TextOverflow.visible,
                minFontSize: 12,
              ),
            ),
          ),
        )
        .closed;
  }
}
