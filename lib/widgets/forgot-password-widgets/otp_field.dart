import 'package:bi_gift_app/widgets/base-widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class OtpField extends StatefulWidget {
  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  //const OtpField({Key? key}) : super(key: key);
  FocusNode nodeOne = FocusNode();
  FocusNode nodeTwo = FocusNode();
  FocusNode nodeThree = FocusNode();
  FocusNode nodeFour = FocusNode();

  List<bool> isFilledList = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    List<FocusNode> nodes = [nodeOne, nodeTwo, nodeThree, nodeFour];
    var mediaQuery = MediaQuery.maybeOf(context)!.size;
    return Column(
      children: [
        SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              textAlign: TextAlign.center,
              isFilled: isFilledList[0],
              node: nodes[0],
              onChanged: (value) => setState(
                () {
                  isFilledList[0] = true;
                  FocusScope.of(context).requestFocus(nodes[1]);
                },
              ),
              height: mediaQuery.height / 20,
              width: mediaQuery.width / 8,
              inputType: TextInputType.number,
              lengthLimitingTextInput: 1,
            ),
            CustomTextField(
              textAlign: TextAlign.center,
              isFilled: isFilledList[1],
              node: nodes[1],
              onChanged: (value) => setState(
                () {
                  isFilledList[1] = true;
                  FocusScope.of(context).requestFocus(nodes[2]);
                },
              ),
              height: mediaQuery.height / 20,
              width: mediaQuery.width / 8,
              inputType: TextInputType.number,
              lengthLimitingTextInput: 1,
            ),
            CustomTextField(
              textAlign: TextAlign.center,
              isFilled: isFilledList[2],
              node: nodes[2],
              onChanged: (value) => setState(
                () {
                  isFilledList[2] = true;
                  FocusScope.of(context).requestFocus(nodes[3]);
                },
              ),
              height: mediaQuery.height / 20,
              width: mediaQuery.width / 8,
              inputType: TextInputType.number,
              lengthLimitingTextInput: 1,
            ),
            CustomTextField(
              textAlign: TextAlign.center,
              isFilled: isFilledList[3],
              node: nodes[3],
              onChanged: (value) => setState(
                () {
                  isFilledList[3] = true;
                  FocusScope.of(context).requestFocus(nodes[3]);
                },
              ),
              height: mediaQuery.height / 20,
              width: mediaQuery.width / 8,
              inputType: TextInputType.number,
              lengthLimitingTextInput: 1,
            ),
          ],
        ),
      ],
    );
  }
}
