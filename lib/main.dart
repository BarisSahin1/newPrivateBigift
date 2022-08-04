import 'package:bi_gift_app/screens/dashboard_screen.dart';
import 'package:bi_gift_app/screens/forgot_password_screen.dart';
import 'package:bi_gift_app/screens/login_screen.dart';
import 'package:bi_gift_app/screens/new_screen.dart';
import 'package:bi_gift_app/screens/user_profile_screen.dart';
import 'package:bi_gift_app/screens/user_profile_update_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Color.fromARGB(255, 253, 176, 61),
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.indigo,
        appBarTheme: AppBarTheme(
          color: Colors.red[600],
        ),
      ),
      home: LoginScreen(),
      routes: {
        ForgotPasswordScreen.routeName: (ctx) => ForgotPasswordScreen(),
        DashBoardScreen.routeName: (context) => DashBoardScreen(),
        MyWidget.routeName: (context) => MyWidget(),
        UserProfileScreen.routeName: (context) => UserProfileScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        UserProfileUpdate.routeName: (context) => UserProfileUpdate(),
      },
    );
  }
}
