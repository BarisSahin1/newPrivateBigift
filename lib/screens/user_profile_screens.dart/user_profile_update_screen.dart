import 'package:bi_gift_app/extensions/media_query_extension.dart';
import 'package:bi_gift_app/model/login_models/login_user_model.dart';
import 'package:bi_gift_app/screens/login_screens.dart/login_view_model.dart';
import 'package:bi_gift_app/screens/user_profile_screens.dart/user_profile_view_model.dart';
import 'package:bi_gift_app/utils/styles/app_styles.dart';
import 'package:bi_gift_app/widgets/user-profile-widgets/user_profile_update.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfileUpdate extends StatelessWidget {
  static const routeName = 'User-profile-screen';
  Widget build(BuildContext context) {
    //Providers
    final userProvider = Provider.of<LoginViewModel>(context);
    final userProfileProvider = Provider.of<UserProfileViewModel>(context);
    //final authHeaderParamViewModel = Provider.of<AppService>(context);
    LoginUserModel? user = userProvider.currentUser;
    final emailController = TextEditingController(text: user?.email);
    final nameController = TextEditingController(text: user?.name);
    final nickNameController = TextEditingController(text: user?.nickname);

    return Scaffold(
      backgroundColor: AppStyles.appStyleObject.thirdColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          SizedBox(
            height: context.heightPercentile * 1.5,
          ),
          Center(
            child: Text(
              'Kullanıcı Bilgilerim',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: context.heightPercentile * 3,
          ),

          ProfileUpdateItem(
            controllerParam: nameController,
            labelData: "Ad-Soyad",
          ),
          ProfileUpdateItem(
            controllerParam: emailController,
            labelData: "E-mail",
          ),
          ProfileUpdateItem(
            controllerParam: nickNameController,
            labelData: "Kullanıcı adı",
          ),
          // ProfileUpdateItem(
          //   initialValueOfForm: currentUser.email,
          // ),
          SizedBox(
            height: context.heightPercentile * 3,
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(context.heightPercentile * 1.5),
              backgroundColor: AppStyles.appStyleObject.primaryColor,
              primary: Colors.white,
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            onPressed: () async {
              await userProfileProvider.userUpdate(
                user!,
                nickNameController.text,
                nameController.text,
                emailController.text,
                user.token,
                user.expiry,
                user.client,
              );
            },
            child: const Text('Bilgilerimi Güncelle'),
          ),
        ],
      ),
    );
  }
}
