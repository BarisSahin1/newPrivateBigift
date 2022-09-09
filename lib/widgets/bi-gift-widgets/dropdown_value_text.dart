import 'package:flutter/material.dart';

class DropDownValueTextWidget extends StatelessWidget {
  final String textData;

  DropDownValueTextWidget({
    Key? key,
    this.textData = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final String foo = "@$textData";
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 8,
      ),
      child: Text(
        textData,
        style: TextStyle(
          color: Colors.black,
          fontStyle: FontStyle.italic,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
