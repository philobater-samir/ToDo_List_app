import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_course/My_theme_data.dart';
import 'package:todo_app_course/addTask.dart';
import 'package:todo_app_course/list/list_Screen.dart';
import 'package:todo_app_course/provider/provider.dart';
import 'package:todo_app_course/settings_tab/settings_tab_screen.dart';

class homeScreen extends StatefulWidget {
  static const String routeName = 'hemeScreen';

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int selectedindex = 0;
  late listProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<listProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ToDo List',
          style: TextStyle(
              color: provider.appTheme == ThemeMode.dark
                  ? Colors.black
                  : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
        toolbarHeight: 80,
        centerTitle: true,
        elevation: 0,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6,
        child: BottomNavigationBar(
          currentIndex: selectedindex,
          onTap: (index) {
            selectedindex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/list_icon.png')),
                label: 'List'),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/setting_icon.png')),
                label: 'Setting'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 35,
        ),
        onPressed: () {
          showAddButtonSheet();
        },
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 4, color: Colors.white),
            borderRadius: BorderRadius.circular(100)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedindex],
    );
  }

  List<Widget> tabs = [
    listScreen(),
    settingScreen(),
  ];

  void showAddButtonSheet() {
    showModalBottomSheet(
        backgroundColor: provider.appTheme == ThemeMode.dark
            ? MyThemeData.darkColor
            : MyThemeData.whiteColor,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return addTask();
        });
  }
}
