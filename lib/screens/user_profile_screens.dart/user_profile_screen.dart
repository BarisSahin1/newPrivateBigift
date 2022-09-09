import 'package:bi_gift_app/model/login_models/login_user_model.dart';
import 'package:bi_gift_app/screens/login_screens.dart/login_screen.dart';
import 'package:bi_gift_app/screens/login_screens.dart/login_view_model.dart';
import 'package:bi_gift_app/screens/settings_screens/settings_screen.dart';
import 'package:bi_gift_app/screens/user_profile_screens.dart/user_profile_view_model.dart';
import 'package:bi_gift_app/utils/styles/app_styles.dart';
import 'package:bi_gift_app/widgets/base-widgets/profile_list_tile_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:bi_gift_app/extensions/media_query_extension.dart';
import 'package:provider/provider.dart';
import '../login_screens.dart/login_view_model.dart';
import 'user_profile_update_screen.dart';

class UserProfileScreen extends StatelessWidget {
//   //const UserProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/user-profile-screen';

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginViewModel>(context);
    final userProfileProvider = Provider.of<UserProfileViewModel>(context);
    LoginUserModel? user = loginProvider.currentUser;
    String firstletter = userProfileProvider.userFirstLetters(user!.name ?? "");

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Profilim',
          style: TextStyle(
            color: AppStyles.appStyleObject.primaryColor,
            fontSize: 22,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(
            //   height: context.heightPercentile * 1,
            // ),
            user.email != null
                ? Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: user.imageUrl ?? "",
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          radius: context.widthPercentile * 14,
                          backgroundImage: imageProvider,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: -25,
                        child: RawMaterialButton(
                          onPressed: () {},
                          elevation: 5.0,
                          fillColor: Colors.grey[100],
                          shape: CircleBorder(),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  )
                : //User name first letters
                Container(
                    width: context.heightPercentile * 12,
                    height: context.heightPercentile * 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        firstletter,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
            SizedBox(
              height: context.heightPercentile * 3,
            ),
            Column(
              children: [
                Text(
                  "${user.name}",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "@${user.nickname}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.widthPercentile * 3,
                  vertical: context.heightPercentile * 5),
              child: Container(
                height: context.heightPercentile * 42.5,
                width: context.widthPercentile * 100,
                decoration: BoxDecoration(
                  color: AppStyles.appStyleObject.secondaryColor,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  children: [
                    ProfileListTileItem(
                      textData: "Kullanıcı Bilgileri",
                      iconData: Icons.account_circle_rounded,
                      routeName: UserProfileUpdate.routeName,
                    ),
                    ProfileListTileItem(
                      textData: "Bi-Giftlerim",
                      iconData: Icons.card_giftcard_rounded,
                    ),
                    ProfileListTileItem(
                      textData: "Ayarlar",
                      iconData: Icons.settings_rounded,
                      routeName: SettingScreen.routeName,
                    ),
                    Divider(
                      indent: context.widthPercentile * 3,
                      endIndent: context.widthPercentile * 3,
                      thickness: 2,
                      color: Colors.black,
                    ),
                    ProfileListTileItem(
                      textData: "Çıkış",
                      iconData: Icons.logout_rounded,
                      isLogOut: true,
                      alertDialogFunction: _showAlertDialog,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//alertDialog for logOut button
Future<dynamic>? _showAlertDialog(context) async {
  final userProvider = Provider.of<LoginViewModel>(context, listen: false);
  // final authHeaderParamViewModel =
  //     Provider.of<AppService>(context, listen: false);
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // <-- SEE HERE
        title: const Text('Çıkış'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Uygulamadan çıkış yapmak istediğinize emin misiniz?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Yes'),
            onPressed: () {
              //AppService.deleteToken();
              userProvider.currentUser = null;
              Navigator.pushNamedAndRemoveUntil(
                  context, LoginScreen.routeName, (r) => false);
            },
          ),
        ],
      );
    },
  );
}
