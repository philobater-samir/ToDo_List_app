import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_course/My_theme_data.dart';
import 'package:todo_app_course/list/task_widget.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:todo_app_course/modal/firebase.dart';
import 'package:todo_app_course/modal/task.dart';
import 'package:todo_app_course/provider/provider.dart';

class listScreen extends StatefulWidget {
  static const String routeName = 'listScreen';

  @override
  State<listScreen> createState() => _listScreenState();
}

class _listScreenState extends State<listScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<listProvider>(context);
    if (provider.taskList.isEmpty) {
      provider.getAllTasksFromFireStore();
    }
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: provider.selectedDate,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) {
              provider.setNewSelectedDay(date);
            },
            leftMargin: 20,
            monthColor: Colors.black,
            dayColor: Colors.white,
            activeDayColor: MyThemeData.whiteColor,
            activeBackgroundDayColor: MyThemeData.primaryColor,
            dotsColor: Color(0xFF333A47),
            selectableDayPredicate: (date) => true,
            locale: 'en_ISO',
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return taskWidget(
                  task: provider.taskList[index],
                );
              },
              itemCount: provider.taskList.length,
            ),
          )
        ],
      ),
    );
  }
}
