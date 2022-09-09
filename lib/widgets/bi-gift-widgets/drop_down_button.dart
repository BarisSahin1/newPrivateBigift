import 'package:bi_gift_app/utils/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:bi_gift_app/extensions/media_query_extension.dart';

class DropDownMenuItem extends StatefulWidget {
  List<dynamic>? apiItemsList;

  String? hintText;
  dynamic selectedValue;
  Function? setSelectedValue;
  Widget trailer;

  DropDownMenuItem({
    this.apiItemsList,
    this.hintText = "",
    this.setSelectedValue,
    this.selectedValue,
    required this.trailer,
  });

  @override
  State<DropDownMenuItem> createState() => _DropDownMenuItemState();
}

class _DropDownMenuItemState extends State<DropDownMenuItem> {
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.heightPercentile * 1.5),
      child: Container(
        decoration: BoxDecoration(
          color: AppStyles.appStyleObject.primaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: context.heightPercentile * 6.75,
              width: context.widthPercentile * 60,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: AppStyles.appStyleObject.primaryColor,
                  hint: Text(widget.hintText!),
                  value: widget.selectedValue,
                  items: widget.apiItemsList!
                      .map<DropdownMenuItem<String>>((dynamic value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(
                      () {
                        widget.setSelectedValue!(newValue);
                      },
                    );
                  },
                ),
              ),
            ),
            widget.trailer,
          ],
        ),
      ),
    );
  }
}
