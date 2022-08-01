// ignore_for_file: avoid_unnecessary_containers

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

import 'user_profile_screen.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);
  static const routeName = 'dashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Turn back'),
      ),
      backgroundColor: Colors.blue,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(icon: Icon(Icons.home), onPressed: () {}),
              IconButton(
                  icon: FaIcon(FontAwesomeIcons.hashtag), onPressed: () {}),
              SizedBox(width: 40), // The dummy child
              IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
              IconButton(
                  icon: Icon(Icons.account_circle),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(UserProfileScreen.routeName);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
