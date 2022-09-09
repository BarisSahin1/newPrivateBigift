import 'package:bi_gift_app/screens/dashboard_screens.dart/dashboard_screen.dart';
import 'package:bi_gift_app/screens/login_screens.dart/login_forgot_password_screen.dart';
import 'package:bi_gift_app/screens/login_screens.dart/login_view_model.dart';
import 'package:bi_gift_app/utils/styles/app_styles.dart';
import 'package:bi_gift_app/utils/enums/provider_state.dart';
import 'package:bi_gift_app/widgets/base-widgets/bi_gift_textfield.dart';
import 'package:flutter/material.dart';
import 'package:bi_gift_app/extensions/media_query_extension.dart';
import 'package:provider/provider.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  // Controllers to keep user input value
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //check whether data loading or not

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //dispose controller values end of the lifecycle
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<LoginViewModel>(context);

    return userProvider.providerState == ProviderState.Loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        // Column widget contain children textfields
        : SingleChildScrollView(
            child: Column(
              children: [
                AppTextField(
                  controller: _emailController,
                  icon: Icons.mail,
                  hintText: "E-mail",
                  labelText: "Email",
                ),
                AppTextField(
                  obscureText: true,
                  controller: _passwordController,
                  icon: Icons.lock,
                  hintText: "Password",
                  labelText: "Password",
                ),
                //Forgot a password button
                Container(
                  padding: context.paddingLow,
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(ForgotPasswordScreen.routeName);
                    },
                    child: Text(
                      'Parolamı unuttum ?',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppStyles.appStyleObject.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                //
                ElevatedButton(
                  //Elevated button style
                  style: ElevatedButton.styleFrom(
                    primary: AppStyles.appStyleObject.primaryColor,
                    shape: StadiumBorder(),
                    fixedSize: Size(
                      context.widthPercentile * 80,
                      context.heightPercentile * 7,
                    ),
                    padding: context.paddingLowest,
                    textStyle: TextStyle(
                      fontSize: context.widthPercentile * 5,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: _emailController.text.isEmpty ||
                          _passwordController.text.isEmpty
                      ? null
                      : () async {
                          if (await userProvider.loginErrorCheck(
                            _emailController.text,
                            _passwordController.text,
                          )) {
                            Navigator.of(context).pushReplacementNamed(
                                DashBoardScreen.routeName);
                          }
                        },
                  child: Text('Login'),
                ),
              ],
            ),
          );
  }
}
