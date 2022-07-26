import 'package:flutter/material.dart';

extension MediaQueryWithValues on BuildContext {
  double width(val) => MediaQuery.of(this).size.width / val;
  double height(val) => MediaQuery.of(this).size.height / val;
}

extension MediaQueryValues on BuildContext {
  double get widthMediaQuery => MediaQuery.of(this).size.width;
  double get heightMediaQuery => MediaQuery.of(this).size.height;
}

// extension MediaQueryExtension on BuildContext {
//   double get height => mediaQuery.size.height;
//   double get width => mediaQuery.size.width;

//   double get lowValue => height * 0.01;
//   double get normalValue => height * 0.02;
//   double get mediumValue => height * 0.04;
//   double get highValue => height * 0.1;
// }

// extension ThemeExtension on BuildContext {
//   ThemeData get theme => Theme.of(this);
//   TextTheme get textTheme => theme.textTheme;
//   ColorScheme get colors => theme.colorScheme;
// }

// extension PaddingExtension on BuildContext {
//   EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
//   EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
//   EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
//   EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
// }
