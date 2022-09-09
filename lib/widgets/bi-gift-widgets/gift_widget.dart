import 'package:bi_gift_app/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import "package:bi_gift_app/extensions/media_query_extension.dart";

class GiftWidget extends StatelessWidget {
  const GiftWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: context.heightPercentile * 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            width: context.widthPercentile * 100,
            decoration: BoxDecoration(
              color: AppStyles.appStyleObject.primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.widthPercentile * 1,
                    vertical: context.heightPercentile * 0.75,
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.widthPercentile * 1.5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffFFFFFF),
                    ),
                    height: context.heightPercentile * 6,
                    child: Row(
                      children: const [
                        Text("isim\tHashtag\tpuan"),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.widthPercentile * 2,
                    //vertical: context.heightPercentile * 1.5,
                  ),
                  child: TextField(
                    readOnly: true,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    maxLength: 280,
                    showCursor: false,
                    maxLines: 6,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
