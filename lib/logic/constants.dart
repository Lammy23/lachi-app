import 'package:flutter/material.dart';

//bunch of constants that we will use in our app

//Colors that we use in our app
const kAppBarColor = Color(0xFF000000);
const kActionButtonColor = Color(0xFFF4803B);
const kPrimaryTextColor = Colors.black;
const kSecondaryTextColor = Colors.white;
const kBackgroundColor = Color(0xFFFFFFFF);
Color kOutlineColor = Colors.black.withOpacity(0.25);
const kInStockColor = Color(0xff007600);
const kOutOfStockColor = Colors.red;
FontWeight kbuttonWeight = FontWeight.w600;

//important values

//Margin that we use in our app (formulas)
kDefaultMargin(double width) {
  return width * 0.101;
}

//Padding that we use in our app (formulas)
kEdgePadding(double height) {
  return height * 0.035;
}

kNormalPadding(double height) {
  return height * 0.022;
}

kGroupedPadding(double height) {
  return height * 0.013;
}

//Fontsizes used in this app (formulas)

// customs

kCheckoutImageSize(width) {
  return width * 0.25;
}

kItemBlockWhiteBorderWidth(width) {
  return width * 0.5;
}

kItemBlockWhiteBorderHeight(height) {
  return height * 0.075;
}

kCheckoutBlockSpaceBox(width) {
  return width * 0.045;
}
