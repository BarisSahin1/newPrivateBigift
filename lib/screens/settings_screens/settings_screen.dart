import 'package:bi_gift_app/utils/styles/app_styles.dart';
import 'package:bi_gift_app/widgets/base-widgets/profile_list_tile_item.dart';
import 'package:flutter/material.dart';
import 'package:bi_gift_app/extensions/media_query_extension.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);
  static const routeName = "settings-route";
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.appStyleObject.thirdColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Text(
          "Ayarlar",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.widthPercentile * 3,
            vertical: context.heightPercentile * 5),
        child: Column(
          children: [
            SizedBox(
              height: context.heightPercentile * 2,
            ),
            Column(
              children: [
                SizedBox(
                  height: context.heightPercentile * 4,
                ),
                ProfileListTileItem(
                  textData: "Bildirimler",
                  iconData: Icons.notifications_active,
                  isNotification: true,
                ),
                ProfileListTileItem(
                  textData: "Hakkımızda",
                  iconData: Icons.book_rounded,
                ),
                ProfileListTileItem(
                  textData: "Bizi Değerlendirin",
                  iconData: Icons.star_purple500_sharp,
                ),
                ProfileListTileItem(
                  textData: "Hesabımı sil",
                  iconData: Icons.delete_forever,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
