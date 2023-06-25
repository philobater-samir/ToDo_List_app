import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_course/My_theme_data.dart';
import 'package:todo_app_course/list/editTask.dart';
import 'package:todo_app_course/modal/firebase.dart';
import 'package:todo_app_course/modal/task.dart';
import 'package:todo_app_course/provider/provider.dart';

class taskWidget extends StatefulWidget {
  Task task;

  taskWidget({required this.task});

  @override
  State<taskWidget> createState() => _taskWidgetState();
}

class _taskWidgetState extends State<taskWidget> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<listProvider>(context);
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            editTask.routeName,
            arguments: widget.task,
          );
        },
        child: Slidable(
          startActionPane: ActionPane(
            extentRatio: .25,
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    topLeft: Radius.circular(12)),
                onPressed: (context) {
                  deleteTaskFromFireStore(widget.task)
                      .timeout(Duration(milliseconds: 500), onTimeout: () {
                    provider.getAllTasksFromFireStore();
                  });
                },
                backgroundColor: Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: provider.appLanguage == 'ar'
                    ? AppLocalizations.of(context)!.delete
                    : AppLocalizations.of(context)!.delete,
              ),
            ],
          ),
          child: Container(
            margin: EdgeInsets.only(
              right: 15,
            ),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: provider.appTheme == ThemeMode.dark
                    ? MyThemeData.darkColor
                    : Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: widget.task.isChecked
                      ? MyThemeData.greenColor
                      : MyThemeData.primaryColor,
                  width: 4,
                  height: 80,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.task.title,
                        style: widget.task.isChecked
                            ? TextStyle(
                                color: MyThemeData.greenColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)
                            : TextStyle(
                                color: MyThemeData.primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        widget.task.description,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    provider.doneTask(widget.task);
                    widget.task.isChecked = !widget.task.isChecked;
                    setState(() {});
                  },
                  child: widget.task.isChecked
                      ? Text(
                    provider.appLanguage == 'ar'
                              ? AppLocalizations.of(context)!.done
                              : AppLocalizations.of(context)!.done,
                          style: TextStyle(
                              color: MyThemeData.greenColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )
                      : Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 21, vertical: 7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: MyThemeData.primaryColor),
                          child: Icon(
                            Icons.check,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                )
              ],
            ),
          ),
        ));
  }
}
