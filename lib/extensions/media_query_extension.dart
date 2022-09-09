import 'package:flutter/material.dart';

extension MediaQueryWithValues on BuildContext {
  double widthVal(val) => MediaQuery.of(this).size.width / val;
  double heightVal(val) => MediaQuery.of(this).size.height / val;
}

// extension sizeExtension on BuildContext {
//   double get sizeExt => 10;
// }

extension SizeRatio on BuildContext {
  double get widthPercentile => width / 100;
  double get heightPercentile => height / 100;
}

extension MediaQueryExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  double get lowestValue => height * 0.005;
  double get lowValue => height * 0.01;
  double get normalValue => height * 0.015;
  double get mediumValue => height * 0.020;
  double get highValue => height * 0.025;
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingLowest => EdgeInsets.all(lowestValue);
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
}
