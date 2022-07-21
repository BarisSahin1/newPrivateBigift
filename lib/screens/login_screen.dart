import 'package:bi_gift_app/extensions/media_query_extension.dart';
import 'package:bi_gift_app/widgets/login_form.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
          padding: EdgeInsets.all(context.width(26)),
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
            margin: EdgeInsets.only(right: 18),
            child: Icon(
              Icons.card_giftcard,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          //Gift image with a container
          Expanded(
            flex: 5,
            child: Container(
              //margin: EdgeInsets.only(top: mediaquery.height / 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Image.asset(
                'assets/images/gift.png',
                height: 150,
                width: 150,
                fit: BoxFit.contain,
              ),
            ),
          ),

          Expanded(
            flex: 6,
            child: Container(
              // margin: EdgeInsets.only(
              //   top: mediaquery.height / 20,
              // ),
              child: LoginForm(),
            ),
          ),

          Expanded(
            flex: 2,
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
