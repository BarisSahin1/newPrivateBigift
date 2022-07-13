import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      //AppBar's styled title with the help of wrapper container widget
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          // decoration: BoxDecoration(
          //     border: Border.all(
          //       color: Colors.black,
          //       width: 2,
          //     ),
          //     ),
          child: const Text(
            'Bi Gift',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
}
