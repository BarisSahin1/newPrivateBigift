import "package:flutter/material.dart";

import 'otp_field.dart';
import 'otp_timer.dart';

Future forgotPasswordAlerDialog(context) {
  return showDialog(
    context: context,
    builder: (ctx) => StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          title: const Text(
            'Please enter a 4 digit verification number.',
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
