import 'package:bi_gift_app/screens/hashtags_screens.dart/hashtag_view_model.dart';
import 'package:bi_gift_app/widgets/bi-gift-widgets/gift_widget.dart';
import 'package:bi_gift_app/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class HashtagScreen extends StatefulWidget {
  const HashtagScreen({Key? key}) : super(key: key);

  @override
  State<HashtagScreen> createState() => _HashtagScreenState();
}

class _HashtagScreenState extends State<HashtagScreen> {
  @override
  Widget build(BuildContext context) {
    List items = List<String>.generate(10000, (i) => 'Item $i');
    final hashtagProvider = Provider.of<HashtagViewModel>(context);
    return Container(
      child: ListView.builder(
        physics: ScrollPhysics(),
        itemCount: hashtagProvider.gethashtagList!.length,
        // prototypeItem: ExpansionTile(
        //   title: Text(items[0]),
        // ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppStyles.appStyleObject.thirdColor,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              child: ExpansionTile(
                leading: FaIcon(
                  FontAwesomeIcons.hashtag,
                  size: 20,
                  color: AppStyles.appStyleObject.primaryColor,
                ),
                title: Text(
                  hashtagProvider.gethashtagList![index],
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
                children: [
                  ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return GiftWidget();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
