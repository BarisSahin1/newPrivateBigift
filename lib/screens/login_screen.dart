import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 176, 61),
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
        actions: [
          Container(
            margin: EdgeInsets.only(right: 18),
            child: Icon(
              Icons.card_giftcard,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'E-mail',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'password',
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(90, 50),
              padding: const EdgeInsets.all(8),
              textStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {},
            child: Text('Login'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text('Forgot a password ?'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
