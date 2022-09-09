import 'package:bi_gift_app/extensions/media_query_extension.dart';
import 'package:bi_gift_app/utils/styles/app_styles.dart';
import 'package:bi_gift_app/widgets/login-widgets/login_form.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "login-screen";

  @override
  Widget build(BuildContext context) {
    print("Height : ${context.height} Width: ${context.width}");
    return Scaffold(
      backgroundColor: AppStyles.appStyleObject.thirdColor,
      //AppBar's styled title with the help of wrapper container widget
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      // Column widget contain children textfields
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              //sizedBox to space out top of the gift image
              SizedBox(
                height: context.heightPercentile * 4.5,
              ),
              //Gift image with wrapper container for styling
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Image.asset(
                  'assets/images/gift-card-white.jpg',
                  height: context.heightPercentile * 19,
                  width: context.heightPercentile * 19,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: context.heightPercentile * 2.5,
              ),
              Text(
                "Hoşgeldiniz !",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(
                height: context.heightPercentile * 4,
              ),
              //Call LoginFormWidget
              LoginFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
