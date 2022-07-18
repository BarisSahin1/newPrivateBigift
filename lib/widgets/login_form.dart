import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _submitted = false;
  String mailRegex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? mailCheck(TextEditingController? emailController) {
    if (emailController != null) {
      final String? text = emailController.value.text;
      //text?.isEmpty ?? true
      if (text == null || text.isEmpty) {
        return "Field can not be empty";
      }
      if (text == " ") {
        return "Field can not be blank";
      }
      if (!RegExp(mailRegex).hasMatch(text)) {
        return "Please check your email format.";
      }
    }
    return null;
  }

  String? passwordCheck(TextEditingController? passwordController) {
    if (passwordController != null) {
      final String? text = passwordController.value.text;
      //text?.isEmpty ?? true
      if (text == null || text.isEmpty) {
        return "Field can not be empty";
      }
      if (text == " ") {
        return "Field can not be blank";
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            controller: _emailController,
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
              labelText: 'Email',
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.bold,
                //color: Theme.of(context).primaryColor,
              ),
              hintText: 'E-mail',
              hintStyle: TextStyle(
                fontSize: 18,
              ),
              errorText: _submitted ? mailCheck(_emailController) : null,
            ),
            onChanged: (_) => setState(
              () {},
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            obscureText: true,
            controller: _passwordController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              prefixIcon: Icon(
                Icons.lock,
                color: Theme.of(context).primaryColor,
              ),
              labelText: 'Password',
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
              hintText: 'Password',
              hintStyle: TextStyle(fontSize: 18),
              errorText: _submitted ? passwordCheck(_passwordController) : null,
            ),
            onChanged: (_) => setState(
              () {},
            ),
          ),
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
          onPressed: () {
            setState(() {
              if (_submitted == false) {
                _submitted = true;
              }
            });
          },
          child: Text('Login'),
        ),
      ],
    );
  }
}
