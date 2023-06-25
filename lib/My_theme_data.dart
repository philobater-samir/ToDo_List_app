import 'package:flutter/material.dart';

class MyThemeData {
  static Color primaryColor = Color(0xff5D9CEC);
  static Color whiteColor = Color(0xffFFFFFF);
  static Color blackColor = Color(0xff060E1E);
  static Color darkColor = Color(0xff141922);
  static Color backgroundColor = Color(0xffDFECDB);
  static Color redColor = Color(0xffEC4B4B);
  static Color greenColor = Color(0xff61E757);

  static ThemeData LightTheme = ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
        color: MyThemeData.primaryColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: MyThemeData.primaryColor,
          unselectedItemColor: Colors.grey),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: MyThemeData.primaryColor));
  static ThemeData DarkTheme = ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: MyThemeData.blackColor,
      appBarTheme: AppBarTheme(
        color: MyThemeData.primaryColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: MyThemeData.blackColor,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: MyThemeData.whiteColor,
          unselectedItemColor: Colors.grey),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: MyThemeData.darkColor));
}
