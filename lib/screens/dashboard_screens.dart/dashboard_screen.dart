import 'package:bi_gift_app/screens/bi_gift_screens.dart/bi_gift_screen.dart';
import 'package:bi_gift_app/screens/dashboard_screens.dart/dashboard_view_model.dart';
import 'package:bi_gift_app/screens/hashtags_screens.dart/hashtag_screen.dart';
import 'package:bi_gift_app/utils/styles/app_styles.dart';
import 'package:bi_gift_app/widgets/base-widgets/snackbar_message_widget.dart';
import 'package:bi_gift_app/widgets/bi-gift-widgets/bi_gift_alert_dialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:bi_gift_app/extensions/media_query_extension.dart';
import 'package:provider/provider.dart';

import '../user_profile_screens.dart/user_profile_screen.dart';

class DashBoardScreen extends StatelessWidget {
  static const routeName = 'dashboard';
  final int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    final visibleProvider = Provider.of<DashboardViewModel>(context);
    PageController pageController = PageController(initialPage: 1);
    var pages = [
      BiGiftScreen(
        pageController: pageController,
        providerRef: visibleProvider,
      ),
      UserProfileScreen(),
      HashtagScreen(),
    ];
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: pageController,
        children: pages,
      ),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniCenterDocked,
      // floatingActionButton: AnimatedOpacity(
      //   opacity: visibleProvider.isVisible ? 1.0 : 0.075,
      //   duration: const Duration(milliseconds: 750),
      //   onEnd: () async {
      //     if (!visibleProvider.isVisible) {
      //       await ShowSnackBar.ShowMessages(
      //         context: context,
      //         message: "Don't worry.I'll come back :)",
      //         isSuccesful: true,
      //         duration: 1,
      //       );
      //     }
      //   },
      //   child: Transform.translate(
      //     offset: Offset(0, context.heightPercentile * 4.5),
      //     child: FloatingActionButton(
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(20),
      //       ),
      //       backgroundColor: AppTextStyles.appTextStyleObject.primaryColor,
      //       onPressed: () {
      //         pageController.jumpToPage(0);
      //         visibleProvider.changeFalseVisible();
      //       },
      //       child: Icon(Icons.add),
      //     ),
      //   ),
      // ),
      //SizedBox(width: context.widthPercentile * 10.0),

      bottomNavigationBar: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 30),
            child: Container(
              height: context.heightPercentile * 7,
              child: BottomNavigationBar(
                pageController: pageController,
                providerRef: visibleProvider,
              ),
            ),
          ),
          SizedBox(),
          Positioned(
            top: context.heightPercentile * 1.25,
            child: AnimatedOpacity(
              opacity: visibleProvider.isVisible ? 1.0 : 0.075,
              duration: const Duration(milliseconds: 750),
              onEnd: () async {
                if (!visibleProvider.isVisible) {
                  await ShowSnackBar.ShowMessages(
                    context: context,
                    message: "Don't worry.I'll come back :)",
                    isSuccesful: true,
                    duration: 1,
                  );
                }
              },
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                backgroundColor: AppStyles.appStyleObject.primaryColor,
                onPressed: () {
                  pageController.jumpToPage(0);
                  visibleProvider.changeFalseVisible();
                },
                child: Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Bottom navigation bar builder
class BottomNavigationBar extends StatefulWidget {
  DashboardViewModel? providerRef;
  BottomNavigationBar({
    Key? key,
    required this.pageController,
    this.providerRef,
  }) : super(key: key);

  final PageController pageController;

  @override
  State<BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BottomAppBar(
        color: AppStyles.appStyleObject.secondaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              iconSize: 24,
              icon: Icon(
                Icons.home,
                color: AppStyles.appStyleObject.primaryColor,
              ),
              onPressed: () {
                widget.pageController.jumpToPage(0);
                widget.providerRef!.changeTrueVisible();
                widget.providerRef?.changeFlagTrue();
              },
            ),
            IconButton(
                iconSize: 22,
                icon: FaIcon(
                  FontAwesomeIcons.hashtag,
                  color: AppStyles.appStyleObject.primaryColor,
                ),
                onPressed: () {
                  widget.pageController.jumpToPage(2);
                  widget.providerRef!.changeTrueVisible();
                  widget.providerRef?.changeFlagTrue();
                }),
            SizedBox(width: context.widthPercentile * 10.0),
            IconButton(
                iconSize: 24,
                icon: Icon(Icons.notifications),
                color: AppStyles.appStyleObject.primaryColor,
                onPressed: () {}),
            IconButton(
              iconSize: 24,
              icon: Icon(
                Icons.account_box_rounded,
                color: AppStyles.appStyleObject.primaryColor,
              ),
              onPressed: () {
                if (widget.pageController.page == 0) {
                  biGiftAlertDialog(
                    onConfirmCallback: () {
                      widget.pageController.jumpToPage(1);
                      widget.providerRef!.changeTrueVisible();
                    },
                  );
                } else {
                  widget.pageController.jumpToPage(1);
                  widget.providerRef!.changeTrueVisible();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
