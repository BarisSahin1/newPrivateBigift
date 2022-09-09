import 'package:bi_gift_app/screens/bi_gift_screens.dart/bi_gift_view_model.dart';
import 'package:bi_gift_app/screens/dashboard_screens.dart/dashboard_view_model.dart';
import 'package:bi_gift_app/utils/global/global_key.dart';
import 'package:bi_gift_app/utils/styles/app_styles.dart';
import 'package:bi_gift_app/widgets/bi-gift-widgets/bi_gift_alert_dialog.dart';
import 'package:bi_gift_app/widgets/bi-gift-widgets/drop_down_button.dart';
import 'package:bi_gift_app/widgets/bi-gift-widgets/dropdown_value_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:bi_gift_app/extensions/media_query_extension.dart';
import 'package:provider/provider.dart';

class BiGiftScreen extends StatefulWidget {
  static const routeName = 'bi-gift-route';

  final PageController? pageController;
  DashboardViewModel? providerRef;
  Future<bool>? data;

  BiGiftScreen({
    this.pageController,
    this.providerRef,
  });

  @override
  State<BiGiftScreen> createState() => _BiGiftScreenState();
}

class _BiGiftScreenState extends State<BiGiftScreen> {
  @override
  final biGiftProvider =
      Provider.of<BiGiftViewModel>(GlobalVariable.navState.currentContext!);
  final giftDescriptionController = TextEditingController();
  @override
  void initState() {
    widget.data = biGiftProvider.getBiGiftModel();
    super.initState();
  }

  @override
  void dispose() {
    giftDescriptionController.dispose();
    super.dispose();
  }

  Widget widgetTry() {
    return Container(
      child: Text("data"),
    );
  }

  Widget build(BuildContext context) {
    //Provider
    return FutureBuilder(
      future: widget.data,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xffFFFFFF),
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              leading: CloseButton(
                color: Colors.black,
                onPressed: () {
                  biGiftAlertDialog(
                    onConfirmCallback: () {
                      widget.pageController!.jumpToPage(1);
                      widget.providerRef?.changeTrueVisible();
                      widget.providerRef!.flag;
                    },
                  );
                },
              ),
              centerTitle: true,
              title: Text(
                "",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
            ),
            body: Container(
              padding: EdgeInsets.all(context.heightPercentile * 3.5),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DropDownMenuItem(
                      apiItemsList: biGiftProvider.getUserList(),
                      hintText: "@Alıcı",
                      setSelectedValue: biGiftProvider.userSetSelectedItem,
                      selectedValue: biGiftProvider.getUserSelectedVal,
                      trailer: CachedNetworkImage(
                        imageUrl: "https://picsum.photos/seed/picsum/200/300",
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          radius: context.widthPercentile * 5,
                          backgroundImage: imageProvider,
                        ),
                      ),
                    ),
                    DropDownMenuItem(
                      apiItemsList: biGiftProvider.getHashtagList(),
                      hintText: "#Hashtag",
                      setSelectedValue: biGiftProvider.setHashtagSelectedItem,
                      selectedValue: biGiftProvider.getHashtagSelectedVal,
                      trailer: Container(
                        child: Image.asset(
                          'assets/images/bulb.png',
                          fit: BoxFit.cover,
                          width: 45,
                          height: 45,
                        ),
                      ),
                    ),
                    DropDownMenuItem(
                      apiItemsList: biGiftProvider.getPointList(),
                      hintText: "+Puan",
                      setSelectedValue: biGiftProvider.pointSetSelectedItem,
                      selectedValue: biGiftProvider.getPointSelectedValue,
                      trailer: Image.asset(
                        'assets/images/gift (2).png',
                        fit: BoxFit.cover,
                        width: 32,
                        height: 32,
                      ),
                    ),
                    SizedBox(
                      height: context.heightPercentile * 4,
                    ),
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: context.widthPercentile * 100,
                              decoration: BoxDecoration(
                                color: AppStyles.appStyleObject.secondaryColor,
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
                                        horizontal:
                                            context.widthPercentile * 1.5,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xffFFFFFF),
                                      ),
                                      height: context.heightPercentile * 6,
                                      child: Row(
                                        children: [
                                          DropDownValueTextWidget(
                                              textData: biGiftProvider
                                                  .biGiftModel!
                                                  .userSelectedValue!),
                                          DropDownValueTextWidget(
                                              textData: biGiftProvider
                                                  .getHashtagSelectedVal!),
                                          DropDownValueTextWidget(
                                            textData: biGiftProvider
                                                .getPointSelectedValue!,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: context.widthPercentile * 2,
                                      vertical: context.heightPercentile * 1.5,
                                    ),
                                    child: TextField(
                                      controller: giftDescriptionController,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                      maxLength: 280,
                                      showCursor: true,
                                      maxLines: 6,
                                      keyboardType: TextInputType.multiline,
                                      decoration: InputDecoration(
                                        counterText: "",
                                        border: InputBorder.none,
                                      ),
                                      onChanged: (_) {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: context.heightPercentile * 4.25,
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 20,
                          right: 15,
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor:
                                AppStyles.appStyleObject.primaryColor,
                            child: IconButton(
                              color: Colors.white,
                              onPressed: () async {
                                await biGiftProvider.createGift(
                                  giftDescriptionController.text,
                                  1,
                                  2,
                                  10,
                                  biGiftProvider.getPointSelectedValue!,
                                );
                              },
                              icon: Icon(Icons.wallet_giftcard),
                              iconSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: AppStyles.appStyleObject.primaryColor,
            ),
          );
        }
      },
    );
  }
}
