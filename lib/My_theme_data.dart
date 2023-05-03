import 'package:flutter/material.dart';

class MyThemeData {
  static Color prinaryColor = Color(0xff5D9CEC);
  static Color whiteColor = Color(0xffFFFFFF);
  static Color blachColor = Color(0xff060E1E);
  static Color darkcolor = Color(0xff363636);
  static Color backgroundColor = Color(0xffDFECDB);
  static Color redColor = Color(0xffEC4B4B);
  static Color greenColor = Color(0xff61E757);

  static ThemeData LightTheme = ThemeData(
      primaryColor: prinaryColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
        color: MyThemeData.prinaryColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: MyThemeData.prinaryColor,
          unselectedItemColor: Colors.grey),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: MyThemeData.prinaryColor));
  static ThemeData DarkTheme = ThemeData();
}
