import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_course/provider/provider.dart';

class LanguageItam extends StatefulWidget {
  @override
  State<LanguageItam> createState() => _LanguageItamState();
}

class _LanguageItamState extends State<LanguageItam> {
  late listProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<listProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 120,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          InkWell(
              onTap: () {
                provider.changeLanguage('en');
              },
              child: provider.appLanguage == 'en'
                  ? getSelectedItemWidget(AppLocalizations.of(context)!.english)
                  : getUnSelectedItemWidget(
                      AppLocalizations.of(context)!.english)),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {
                provider.changeLanguage('ar');
              },
              child: provider.appLanguage == 'ar'
                  ? getSelectedItemWidget(AppLocalizations.of(context)!.arabic)
                  : getUnSelectedItemWidget(
                      AppLocalizations.of(context)!.arabic))
        ]),
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
              color: provider.appTheme == ThemeMode.dark
                  ? Colors.white
                  : Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget getUnSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
              color: provider.appTheme == ThemeMode.dark
                  ? Colors.white
                  : Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
