import 'package:flutter/material.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  @override
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

  String? mailCheck(String? text) {
    if (text != null) {
      //final String? text = emailController.value.text;
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

  String? passwordCheck(String text) {
    //final String? text = passwordController.value.text;
    //text?.isEmpty ?? true
    if (text.isEmpty) {
      return "Field can not be empty";
    }
    if (text == " ") {
      return "Field can not be blank";
    }
    return null;
  }

  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  //borderRadius: BorderRadius.all(),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                labelText: 'Email',
                prefixIcon: Icon(
                  Icons.mail,
                  color: Theme.of(context).primaryColor,
                ),
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
              ),
              validator: (value) {
                return mailCheck(value);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              obscureText: true,
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
              ),
              validator: (value) {
                if (value != null) {
                  return passwordCheck(value);
                } else {
                  return 'null';
                }
                // if (value!.isEmpty) {
                //   return "eror";
                // }
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print('a');
              }
            },
            child: const Text('Send'),
          )
        ],
      ),
    );
  }
}
