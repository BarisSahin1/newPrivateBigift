import 'package:bi_gift_app/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:bi_gift_app/extensions/media_query_extension.dart';

class ProfileUpdateItem extends StatelessWidget {
  final TextEditingController? controllerParam;
  final String? labelData;

  const ProfileUpdateItem({
    Key? key,
    this.controllerParam,
    this.labelData = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TextEditingController controller = TextEditingController();
    //  controller.text = UserService.current_user!.name ?? "Null error";
    return Column(
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: context.heightPercentile * 6,
                width: context.widthPercentile * 80,
                child: TextFormField(
                  cursorColor: Colors.black,
                  controller: controllerParam,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    filled: true, //<-- SEE HERE
                    fillColor: Colors.white,
                    labelText: labelData,
                    labelStyle: TextStyle(
                      color: AppStyles.appStyleObject.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        width: 1,
                        color: AppStyles.appStyleObject.primaryColor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        width: 1,
                        color: AppStyles.appStyleObject.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
