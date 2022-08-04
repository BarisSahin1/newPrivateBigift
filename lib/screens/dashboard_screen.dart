// ignore_for_file: avoid_unnecessary_containers

import 'package:bi_gift_app/screens/new_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:bi_gift_app/extensions/media_query_extension.dart';
import 'user_profile_screen.dart';

class DashBoardScreen extends StatelessWidget {
//const DashBoardScreen({Key? key}) : super(key: key);
  static const routeName = 'dashboard';

  int selectedItem = 0;
  var pages = [MyWidget(), UserProfileScreen()];

  @override
  Widget build(BuildContext context) {
    //Controller to manage pageview
    PageController pageController = PageController(initialPage: 0);
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: pages,
      ),
      //Locate Docked button on the bottomNavigationbar
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //Add-new-gift button
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomNavigationBar(pageController: pageController),
    );
  }
}

//Bottom navigation bar splitted widget
class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                pageController.jumpToPage(0);
              },
            ),
            IconButton(
                icon: FaIcon(FontAwesomeIcons.hashtag), onPressed: () {}),
            // Dummy sizedBox
            SizedBox(width: context.widthPercentile * 10.5),
            IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
                pageController.jumpToPage(1);
              },
            ),
          ],
        ),
      ),
    );
  }
}
