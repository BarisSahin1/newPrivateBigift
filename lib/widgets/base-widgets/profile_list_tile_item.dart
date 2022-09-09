// ignore: file_names
import 'package:bi_gift_app/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:bi_gift_app/extensions/media_query_extension.dart';

class ProfileListTileItem extends StatefulWidget {
  String? textData;
  IconData? iconData;
  String? routeName;
  bool isNotification;
  bool status;
  bool isLogOut;
  Future<dynamic>? Function(dynamic)? alertDialogFunction;

  ProfileListTileItem({
    this.routeName,
    this.textData,
    this.iconData,
    this.isNotification = false,
    this.status = false,
    this.isLogOut = false,
    this.alertDialogFunction,
  });

  @override
  State<ProfileListTileItem> createState() => _ProfileListTileItemState();
}

class _ProfileListTileItemState extends State<ProfileListTileItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => widget.isLogOut
          ? widget.alertDialogFunction!(context)
          : Navigator.of(context).pushNamed(widget.routeName!),
      contentPadding: EdgeInsets.symmetric(
          horizontal: context.widthPercentile * 5,
          vertical: context.heightPercentile * 1.5),
      title: Text(
        widget.textData!,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppStyles.appStyleObject.primaryColor,
        ),
      ),
      leading: Padding(
        padding: EdgeInsets.only(left: context.heightPercentile * 0.75),
        child: Container(
          decoration: BoxDecoration(
            color: AppStyles.appStyleObject.primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.all(context.heightPercentile * 1),
            child: Transform.scale(
              scale: 1,
              child: Icon(
                widget.iconData,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      trailing: widget.isNotification
          ? SizedBox(
              width: context.widthPercentile * 9,
              child: Switch(
                  activeColor: AppStyles.appStyleObject.primaryColor,
                  value: widget.status,
                  onChanged: (value) {
                    setState(() {
                      widget.status = value;
                    });
                  }),
            )
          : Icon(
              Icons.keyboard_arrow_right_sharp,
              size: 34,
              color: AppStyles.appStyleObject.primaryColor,
            ),
    );
  }
}
