import 'package:flutter/material.dart';

class MyColors {
  static Color primaryButton = Colors.blue;

  static Color backgroundColor = Colors.blueGrey[600];

  static Color avatarBackground = Colors.white;
  static Color level = Colors.black54;
  static Color lightText = Colors.white;
  static Color darkText = Colors.black12;

  static Color TopClipper = Colors.black54;
  static Color TopClipperTwo = Colors.black26;
  static Color TopClipperThree = Colors.black54.withOpacity(0.1);
  static Color TopClipperFour = Colors.black26.withOpacity(0.1);
//  static MaterialColor primaryButton= Colors.blue;
//  static MaterialColor primaryButton= Colors.blue;
//  static MaterialColor primaryButton= Colors.blue;

}

class MyStyles {
  static TextStyle profileTextStyle = TextStyle(
      color: MyColors.lightText,
      letterSpacing: 1.0,
      fontWeight: FontWeight.bold);
}
