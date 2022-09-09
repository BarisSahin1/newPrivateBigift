import 'package:bi_gift_app/utils/global/global_key.dart';
import 'package:bi_gift_app/widgets/forgot-password-widgets/otp_field.dart';
import 'package:bi_gift_app/widgets/forgot-password-widgets/otp_timer.dart';
import "package:flutter/material.dart";

Future forgotPasswordAlerDialog() async {
  return showDialog(
    context: GlobalVariable.navState.currentContext!,
    builder: (ctx) => StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          title: const Text(
            'Lütfen 4 haneli doğrulama kodunuz giriniz.',
            textAlign: TextAlign.center,
          ),
          actions: [
            OTPTimer(context),
            OtpField(),
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Container(
                color: Colors.green,
                padding: const EdgeInsets.all(14),
                child: const Text(
                  "Okay",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    ),
  );
}
