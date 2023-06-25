import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_course/My_theme_data.dart';
import 'package:todo_app_course/general_tab/home_Screen.dart';
import 'package:todo_app_course/list/editTask.dart';
import 'package:todo_app_course/list/list_Screen.dart';
import 'package:todo_app_course/provider/provider.dart';
import 'package:todo_app_course/settings_tab/settings_tab_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();
  FirebaseFirestore.instance.settings =
      Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  runApp(ChangeNotifierProvider(
      create: (context) => listProvider(), child: Myapptodo()));
}

class Myapptodo extends StatelessWidget {
  late listProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<listProvider>(context);
    intialSharedPref();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        homeScreen.routeName: (context) => homeScreen(),
        listScreen.routeName: (context) => listScreen(),
        settingScreen.routeName: (context) => settingScreen(),
        editTask.routeName: (context) => editTask(),
      },
      initialRoute: homeScreen.routeName,
      theme: MyThemeData.LightTheme,
      darkTheme: MyThemeData.DarkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
      themeMode: provider.appTheme,
    );
  }

  void intialSharedPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String newLanguage = prefs.getString('newLanguage') ?? 'en';
    String? newTheme = prefs.getString('newTheme');
    provider.changeLanguage(newLanguage);
    if (newTheme == 'light') {
      provider.changeTheme(ThemeMode.light);
    } else if (newTheme == 'dark') {
      provider.changeTheme(ThemeMode.dark);
    }
  }
}
