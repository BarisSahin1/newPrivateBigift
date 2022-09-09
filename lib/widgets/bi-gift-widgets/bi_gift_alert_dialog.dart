import 'package:bi_gift_app/utils/global/global_key.dart';
import 'package:flutter/material.dart';
import 'package:bi_gift_app/extensions/media_query_extension.dart';

Future biGiftAlertDialog({Function? onConfirmCallback}) async {
  return showDialog(
    context: GlobalVariable.navState.currentContext!,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        title: const Text(
          'Çıkış',
          textAlign: TextAlign.center,
        ),
        content: Text(
          'İşlemi iptal etmek istediğinize emin misiniz ?',
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
                child: Text(
                  'Hayır',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  Navigator.of(context).pop('Hayır');
                },
              ),
              SizedBox(
                width: context.widthPercentile * 2,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
                child: Text(
                  'Evet',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  onConfirmCallback!();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
        //actions: [],
      );
    },
  );
}
