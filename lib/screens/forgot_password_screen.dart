import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  static const routeName = "forgot_password_route";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 40),
          child: Text(
            'Forgot a password',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          Icon(
            Icons.arrow_downward_rounded,
            size: 60,
          ),
          Container(
            margin: EdgeInsets.only(top: 35),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'We are going to send a verification email to your mail address.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  //borderRadius: BorderRadius.all(),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.mail,
                  color: Theme.of(context).primaryColor,
                ),
                labelText: 'Please write your email',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  //color: Theme.of(context).primaryColor,
                ),
                hintText: 'E-mail',
                hintStyle: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(90, 50),
              padding: const EdgeInsets.all(8),
              textStyle: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {},
            child: Text('Send'),
          ),
        ],
      ),
    );
  }
}
