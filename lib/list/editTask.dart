import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_course/My_theme_data.dart';
import 'package:todo_app_course/modal/task.dart';
import 'package:todo_app_course/provider/provider.dart';

class editTask extends StatefulWidget {
  static const String routeName = 'editTask';

  @override
  State<editTask> createState() => _editTaskState();
}

class _editTaskState extends State<editTask> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late listProvider provider;
  late Task task;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      task = ModalRoute.of(context)?.settings.arguments as Task;
      titleController.text = task.title;
      descriptionController.text = task.description;
      selectedDate = DateTime.fromMillisecondsSinceEpoch(task.date);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<listProvider>(context);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          provider.appLanguage == 'ar'
              ? AppLocalizations.of(context)!.edit_task_appbar
              : AppLocalizations.of(context)!.edit_task_appbar,
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
      body: Center(
        child: Stack(
          children: [
            Container(
              color: provider.appTheme == ThemeMode.dark
                  ? MyThemeData.darkColor
                  : MyThemeData.backgroundColor,
            ),
            Container(
              width: width * 0.9,
              height: height * 0.5,
              margin: EdgeInsets.only(
                  left: width * 0.05,
                  right: width * 0.05,
                  bottom: height * 0.06,
                  top: height * 0.08),
              decoration: BoxDecoration(
                  color: provider.appTheme == ThemeMode.dark
                      ? MyThemeData.blackColor
                      : MyThemeData.whiteColor,
                  borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: titleController,
                          decoration: InputDecoration(
                            labelText: provider.appLanguage == 'ar'
                                ? AppLocalizations.of(context)!.edit_task_title
                                : AppLocalizations.of(context)!.edit_task_title,
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
                          controller: descriptionController,
                          decoration: InputDecoration(
                            labelText: provider.appLanguage == 'ar'
                                ? AppLocalizations.of(context)!
                                    .edit_task_description
                                : AppLocalizations.of(context)!
                                    .edit_task_description,
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
                                      ? AppLocalizations.of(context)!
                                          .edit_task_select_date
                                      : AppLocalizations.of(context)!
                                          .edit_task_select_date,
                                  style: TextStyle(
                                      color: provider.appTheme == ThemeMode.dark
                                          ? Colors.grey
                                          : Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300)),
                              GestureDetector(
                                child: InkWell(
                                  onTap: () {
                                    chooseDate();
                                  },
                                  child: Text(
                                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                                      style: TextStyle(
                                          color: provider.appTheme ==
                                                  ThemeMode.dark
                                              ? Colors.white
                                              : Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300)),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState?.validate() == true) {
                              task.title = titleController.text;
                              task.description = descriptionController.text;
                              task.date = selectedDate.millisecondsSinceEpoch;
                              Provider.of<listProvider>(context, listen: false)
                                  .editTask(task);
                              Provider.of<listProvider>(context, listen: false)
                                  .getAllTasksFromFireStore();
                              Navigator.of(context).pop();
                            }
                            ;
                          },
                          child: Text(
                            provider.appLanguage == 'ar'
                                ? AppLocalizations.of(context)!.edit_task
                                : AppLocalizations.of(context)!.edit_task,
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
                              shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ))),
                        ),
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  void chooseDate() async {
    var chooseDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chooseDate != null) {
      selectedDate = chooseDate;
    }
    setState(() {});
  }
}
