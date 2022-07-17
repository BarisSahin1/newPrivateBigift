import 'package:bi_gift_app/screens/forgot_password_screen.dart';
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
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 253, 176, 61),
      //AppBar's styled title with the help of wrapper container widget
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //FlutterLogo
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
            ),
            child: Center(
              child: FlutterLogo(
                size: 100,
              ),
            ),
          ),
          LoginForm(),
          //Forgot a password button
          Container(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ForgotPasswordScreen.routeName);
              },
              child: Text(
                'Forgot a password ?',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
