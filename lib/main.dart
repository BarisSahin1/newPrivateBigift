import 'package:bi_gift_app/screens/bi_gift_screens.dart/bi_gift_view_model.dart';
import 'package:bi_gift_app/screens/dashboard_screens.dart/dashboard_screen.dart';
import 'package:bi_gift_app/screens/dashboard_screens.dart/dashboard_view_model.dart';
import 'package:bi_gift_app/screens/hashtags_screens.dart/hashtag_view_model.dart';
import 'package:bi_gift_app/screens/login_screens.dart/login_forgot_password_screen.dart';
import 'package:bi_gift_app/screens/login_screens.dart/login_screen.dart';
import 'package:bi_gift_app/screens/login_screens.dart/login_view_model.dart';
import 'package:bi_gift_app/screens/bi_gift_screens.dart/bi_gift_screen.dart';
import 'package:bi_gift_app/screens/settings_screens/settings_screen.dart';
import 'package:bi_gift_app/screens/user_profile_screens.dart/user_profile_screen.dart';
import 'package:bi_gift_app/screens/user_profile_screens.dart/user_profile_update_screen.dart';
import 'package:bi_gift_app/screens/user_profile_screens.dart/user_profile_view_model.dart';
import 'package:bi_gift_app/services/app_services.dart/local_storage_service.dart';
import 'package:bi_gift_app/utils/global/global_key.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

// Color.fromARGB(255, 253, 176, 61),
class MyApp extends StatelessWidget {
  // final Color myHexColor = Color(0xffFFA500);
  MyApp({
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginViewModel>(
            create: (context) => LoginViewModel()),
        ChangeNotifierProvider<UserProfileViewModel>(
            create: (context) => UserProfileViewModel()),
        ChangeNotifierProvider<DashboardViewModel>(
            create: (context) => DashboardViewModel()),
        ChangeNotifierProvider<BiGiftViewModel>(
            create: (context) => BiGiftViewModel()),
        ChangeNotifierProvider<LocalStorageService>(
          create: (context) => LocalStorageService(),
        ),
        ChangeNotifierProvider<HashtagViewModel>(
          create: (context) => HashtagViewModel(),
        ),
        // ChangeNotifierProvider<LoadingProvider>(
        //   create: (context) => LoadingProvider(),
        // ),
      ],
      child: MaterialApp(
        navigatorKey: GlobalVariable.navState,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.black,
          appBarTheme: AppBarTheme(
            color: Color(0xff2C3333),
          ),
        ),
        home: LoginScreen(),
        routes: {
          ForgotPasswordScreen.routeName: (ctx) => ForgotPasswordScreen(),
          DashBoardScreen.routeName: (context) => DashBoardScreen(),
          BiGiftScreen.routeName: (context) => BiGiftScreen(),
          UserProfileScreen.routeName: (context) => UserProfileScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          UserProfileUpdate.routeName: (context) => UserProfileUpdate(),
          SettingScreen.routeName: (context) => SettingScreen(),
        },
      ),
    );
  }
}
