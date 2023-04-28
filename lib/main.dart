import 'package:flutter/material.dart';
import 'package:todo_app_course/home_Screen.dart';

void main() {
  runApp(Myapptodo());
}

class Myapptodo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        homeScreen.routeName: (context) => homeScreen(),
      },
      initialRoute: homeScreen.routeName,
    );
  }
}
