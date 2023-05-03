import 'package:flutter/material.dart';
import 'package:todo_app_course/My_theme_data.dart';
import 'package:todo_app_course/general_tab/home_Screen.dart';
import 'package:todo_app_course/list/list_Screen.dart';
import 'package:todo_app_course/settings_tab/settings_tab_screen.dart';

void main() {
  runApp(Myapptodo());
}

class Myapptodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        homeScreen.routeName: (context) => homeScreen(),
        listScreen.routeName: (context) => listScreen(),
        settingScreen.routeName: (context) => settingScreen()
      },
      initialRoute: homeScreen.routeName,
      theme: MyThemeData.LightTheme,
      darkTheme: MyThemeData.DarkTheme,
    );
  }
}
