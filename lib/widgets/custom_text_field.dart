import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final Color? baseColor;
  final Color? borderColor;
  final Color? errorColor;
  final TextInputType inputType;
  final bool obscureText;
  final Function? validator;
  final Function? onChanged;
  final bool? isFilled;
  final int? lengthLimitingTextInput;
  final double? height;
  final double? width;
  final TextAlign? textAlign;
  final FilteringTextInputFormatter? filteringTextInputFormatter;
  final FocusNode? node;

  const CustomTextField({
    Key? key,
    this.hint,
    this.controller,
    this.onChanged,
    this.baseColor,
    this.borderColor,
    this.errorColor,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.isFilled,
    this.lengthLimitingTextInput,
    this.height,
    this.width,
    this.textAlign = TextAlign.center,
    this.filteringTextInputFormatter,
    this.node,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SizedBox(
        width: width,
        height: height,
        child: TextField(
          autofocus: true,
          focusNode: node,
          obscureText: obscureText,
          onChanged: (_) {
            onChanged!(isFilled);
          },
          textAlign: textAlign!,
          keyboardType: inputType,
          controller: controller,
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: baseColor,
              fontWeight: FontWeight.bold,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color:
                    isFilled! ? Theme.of(context).primaryColor : Colors.black,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color:
                    isFilled! ? Theme.of(context).primaryColor : Colors.black,
              ),
            ),

            hintText: hint,
            // labelStyle: TextStyle(
            //   fontSize: 20,
            // ),
          ),
          inputFormatters: [
            LengthLimitingTextInputFormatter(lengthLimitingTextInput),
          ],
        ),
      ),
    );
  }
}
