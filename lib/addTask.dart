import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_course/My_theme_data.dart';
import 'package:todo_app_course/modal/firebase.dart';
import 'package:todo_app_course/modal/task.dart';
import 'package:todo_app_course/provider/provider.dart';

class addTask extends StatefulWidget {
  @override
  State<addTask> createState() => _addTaskState();
}

class _addTaskState extends State<addTask> {
  String title = ' ';

  String description = '';

  DateTime selectedDate = DateTime.now();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late listProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<listProvider>(context);
    return SingleChildScrollView(
      child: Container(
        color: provider.appTheme == ThemeMode.dark
            ? MyThemeData.darkColor
            : Colors.white,
        margin: EdgeInsets.all(15),
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              Text(
                provider.appLanguage == 'ar'
                    ? AppLocalizations.of(context)!.add_task
                    : AppLocalizations.of(context)!.add_task,
                style: TextStyle(
                    color: provider.appTheme == ThemeMode.dark
                        ? Colors.white
                        : Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (text) {
                          title = text;
                        },
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return provider.appLanguage == 'ar'
                                ? AppLocalizations.of(context)!.title
                                : AppLocalizations.of(context)!.title;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: provider.appLanguage == 'ar'
                              ? AppLocalizations.of(context)!.title
                              : AppLocalizations.of(context)!.title,
                          labelStyle: TextStyle(
                              color: provider.appTheme == ThemeMode.dark
                                  ? Colors.grey
                                  : Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: provider.appTheme == ThemeMode.dark
                                    ? Colors.grey
                                    : Colors.black),
                          ),
                        ),
                        maxLines: 1,
                        style: TextStyle(
                            color: provider.appTheme == ThemeMode.dark
                                ? Colors.white
                                : Colors.black),
                      ),
                      TextFormField(
                        onChanged: (text) {
                          description = text;
                        },
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return provider.appLanguage == 'ar'
                                ? AppLocalizations.of(context)!.description
                                : AppLocalizations.of(context)!.description;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: provider.appLanguage == 'ar'
                              ? AppLocalizations.of(context)!.description
                              : AppLocalizations.of(context)!.description,
                          labelStyle: TextStyle(
                              color: provider.appTheme == ThemeMode.dark
                                  ? Colors.grey
                                  : Colors.black),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: provider.appTheme == ThemeMode.dark
                                    ? Colors.grey
                                    : Colors.black),
                          ),
                        ),
                        maxLines: 6,
                        style: TextStyle(
                            color: provider.appTheme == ThemeMode.dark
                                ? Colors.white
                                : Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                provider.appLanguage == 'ar'
                                    ? AppLocalizations.of(context)!.select_date
                                    : AppLocalizations.of(context)!.select_date,
                                style: TextStyle(
                                    color: provider.appTheme == ThemeMode.dark
                                        ? Colors.grey
                                        : Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300)),
                            InkWell(
                              onTap: () {
                                chooseDate();
                              },
                              child: Text(
                                  '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                                  style: TextStyle(
                                      color: provider.appTheme == ThemeMode.dark
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300)),
                            )
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          addTaskToList();
                        },
                        child: Text(
                          'Add Task',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        style: ButtonStyle(
                            foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                MyThemeData.primaryColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ))),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void chooseDate() async {
    var chooseDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chooseDate != null) {
      selectedDate = chooseDate;
    }
    setState(() {});
  }

  void addTaskToList() {
    if (formKey.currentState?.validate() == true) {
      Task task = Task(
          description: description,
          title: title,
          date: selectedDate.millisecondsSinceEpoch);
      addTaskToFireStore(task).timeout(Duration(milliseconds: 500),
          onTimeout: () {
        provider.getAllTasksFromFireStore();
        Navigator.pop(context);
      });
    }
  }
}
