import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_course/My_theme_data.dart';
import 'package:todo_app_course/provider/provider.dart';
import 'package:todo_app_course/settings_tab/language_item.dart';
import 'package:todo_app_course/settings_tab/theme_item.dart';

class settingScreen extends StatefulWidget {
  static const String routeName = 'settingScreen';

  @override
  State<settingScreen> createState() => _settingScreenState();
}

class _settingScreenState extends State<settingScreen> {
  late listProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<listProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  provider.appLanguage == 'ar'
                      ? AppLocalizations.of(context)!.language
                      : AppLocalizations.of(context)!.language,
                  style: TextStyle(
                      color: provider.appTheme == ThemeMode.dark
                          ? Colors.white
                          : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    showLanguageItem();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: provider.appTheme == ThemeMode.dark
                            ? MyThemeData.darkColor
                            : MyThemeData.primaryColor),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            provider.appLanguage == 'ar'
                                ? AppLocalizations.of(context)!.arabic
                                : AppLocalizations.of(context)!.english,
                            style: TextStyle(
                                color: provider.appTheme == ThemeMode.dark
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  provider.appLanguage == 'ar'
                      ? AppLocalizations.of(context)!.theme
                      : AppLocalizations.of(context)!.theme,
                  style: TextStyle(
                      color: provider.appTheme == ThemeMode.dark
                          ? Colors.white
                          : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    showThemeItem();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: provider.appTheme == ThemeMode.dark
                            ? MyThemeData.darkColor
                            : MyThemeData.primaryColor),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            provider.appTheme == ThemeMode.dark
                                ? AppLocalizations.of(context)!.dark
                                : AppLocalizations.of(context)!.light,
                            style: TextStyle(
                                color: provider.appTheme == ThemeMode.dark
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showLanguageItem() {
    showModalBottomSheet(
        backgroundColor: provider.appTheme == ThemeMode.dark
            ? MyThemeData.darkColor
            : MyThemeData.whiteColor,
        context: context,
        builder: (context) {
          return LanguageItam();
        });
  }

  void showThemeItem() {
    showModalBottomSheet(
        backgroundColor: provider.appTheme == ThemeMode.dark
            ? MyThemeData.darkColor
            : MyThemeData.whiteColor,
        context: context,
        builder: (context) {
          return themeItem();
        });
  }
}
