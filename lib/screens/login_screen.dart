import 'package:bi_gift_app/extensions/media_query_extension.dart';
import 'package:bi_gift_app/widgets/login_form.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "login-screen";

  @override
  Widget build(BuildContext context) {
    print("Height : ${context.height} Width: ${context.width}");
    return Scaffold(
      //AppBar's styled title with the help of wrapper container widget
      appBar: AppBar(
        title: Container(
          padding: context.paddingMedium,
          child: const Text(
            'Bi Gift',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        // Gift icon
        actions: [
          Container(
            padding: EdgeInsets.only(right: context.widthPercentile * 4),
            child: Icon(
              Icons.card_giftcard,
              size: context.heightPercentile * 3.75,
            ),
          ),
        ],
      ),
      // Column widget contain children textfields
      body: SingleChildScrollView(
        child: Column(
          children: [
            //sizedBox to space out top of the gift image
            SizedBox(
              height: context.heightPercentile * 8.5,
            ),
            //Gift image with wrapper container for styling
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Image.asset(
                'assets/images/gift.png',
                height: context.heightPercentile * 19,
                width: context.heightPercentile * 19,
                fit: BoxFit.contain,
              ),
            ),

            SizedBox(
              height: context.heightPercentile * 6.7,
            ),
            //Call LoginFormWidget
            LoginFormWidget(),
          ],
        ),
      ),
    );
  }
}
