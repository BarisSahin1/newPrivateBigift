import 'dart:async';

import 'package:flutter/material.dart';

enum Resend {
  contiune,
  notContiuned,
}

class OTPTimer extends StatefulWidget {
  //const OTPTimer({Key? key}) : super(key: key);
  BuildContext ctx;

  OTPTimer(
    this.ctx,
  );

  @override
  State<OTPTimer> createState() => _OTPTimerState(ctx);
}

class _OTPTimerState extends State<OTPTimer> {
  late Timer? countDownTimer;
  Duration myDuration = Duration(minutes: 1);
  Resend? continued = Resend.contiune;
  BuildContext ctx;
  _OTPTimerState(this.ctx);

  Widget showText() {
    return TextButton(onPressed: resetTimer, child: Text('Re-send'));
  }

  void stopTimer() {
    setState(() => countDownTimer!.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(() {
      myDuration = Duration(minutes: 1);
      startTimer();
    });
  }

  void startTimer() {
    countDownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countDownTimer!.cancel();
        continued = Resend.notContiuned;
      } else {
        myDuration = Duration(seconds: seconds);
        continued = Resend.contiune;
      }
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    countDownTimer!.cancel();

    super.dispose();
    //countDownTimer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        continued == Resend.contiune
            ? Text(
                '$minutes:$seconds',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 18,
                ),
              )
            : showText(),
      ],
    );
  }
}
