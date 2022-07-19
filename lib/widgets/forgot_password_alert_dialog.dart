import 'package:bi_gift_app/widgets/custom_text_field.dart';
import "package:flutter/material.dart";

bool textfieldState = false;
Future myDialog(context) {
  var mediaQuery = MediaQuery.maybeOf(context)!.size;

  FocusNode nodeOne = FocusNode();
  FocusNode nodeTwo = FocusNode();
  FocusNode nodeThree = FocusNode();
  FocusNode nodeFour = FocusNode();

  List<bool> isFilledList = [false, false, false, false];
  List<FocusNode> nodes = [nodeOne, nodeTwo, nodeThree, nodeFour];

  return showDialog(
    context: context,
    builder: (ctx) => StatefulBuilder(
      builder: (context, setState) {
        print(textfieldState);
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          title: const Text(
            'Please enter a 4 digit verification number.',
            textAlign: TextAlign.center,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  textAlign: TextAlign.center,
                  isFilled: isFilledList[0],
                  node: nodeOne,
                  onChanged: (value) => setState(() => isFilledList[0] = true),
                  height: mediaQuery.height / 20,
                  width: mediaQuery.width / 8,
                  inputType: TextInputType.number,
                  lengthLimitingTextInput: 1,
                ),
                CustomTextField(
                  textAlign: TextAlign.center,
                  isFilled: isFilledList[1],
                  node: nodeTwo,
                  onChanged: (value) => setState(() => isFilledList[1] = true),
                  height: mediaQuery.height / 20,
                  width: mediaQuery.width / 8,
                  inputType: TextInputType.number,
                  lengthLimitingTextInput: 1,
                ),
                CustomTextField(
                  textAlign: TextAlign.center,
                  isFilled: isFilledList[2],
                  node: nodeThree,
                  onChanged: (value) => setState(() => isFilledList[2] = true),
                  height: mediaQuery.height / 20,
                  width: mediaQuery.width / 8,
                  inputType: TextInputType.number,
                  lengthLimitingTextInput: 1,
                ),
                CustomTextField(
                  textAlign: TextAlign.center,
                  isFilled: isFilledList[3],
                  node: nodeFour,
                  onChanged: (value) => setState(() => isFilledList[3] = true),
                  height: mediaQuery.height / 20,
                  width: mediaQuery.width / 8,
                  inputType: TextInputType.number,
                  lengthLimitingTextInput: 1,
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Container(
                color: Colors.green,
                padding: const EdgeInsets.all(14),
                child: const Text(
                  "Okay",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    ),
  );
}
