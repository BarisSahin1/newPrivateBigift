import 'package:bi_gift_app/extensions/media_query_extension.dart';
import 'package:bi_gift_app/widgets/login_form.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = "login-screen";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.maybeOf(context)!.size;
    print(mediaquery);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor: Color.fromARGB(255, 253, 176, 61),
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
        actions: [
          Container(
            padding: EdgeInsets.only(right: context.widthVal(25)),
            child: Icon(
              Icons.card_giftcard,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Gift image with a container
            Container(
              padding: EdgeInsets.only(
                top: context.heightVal(12),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Image.asset(
                'assets/images/gift.png',
                height: context.heightVal(5.30),
                width: context.heightVal(5.30),
                fit: BoxFit.contain,
              ),
            ),

            Container(
              margin: EdgeInsets.only(
                top: context.heightVal(15),
              ),
              child: LoginForm(),
            ),
          ],
        ),
      ),
    );
  }
}
