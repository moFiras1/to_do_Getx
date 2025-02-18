import 'package:flutter/material.dart';

class MyThemeData {
  static Color myBlackColor = Color(0xff000000);
  static Color myGrayColor = Color(0xff757575);

  static ThemeData lightTheme = ThemeData(
    primaryColor: myBlackColor,
    scaffoldBackgroundColor: Color(0xffF5F5F5),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 34, color: myBlackColor, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(fontSize: 12, color: myGrayColor),
    ),
  );
}
