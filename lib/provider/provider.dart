import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../modal/firebase.dart';
import '../modal/task.dart';

class listProvider extends ChangeNotifier {
  List<Task> taskList = [];
  DateTime selectedDate = DateTime.now();

  getAllTasksFromFireStore() async {
    QuerySnapshot<Task> querySnapshot = await getTaskCollection().get();
    taskList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();

    taskList = taskList.where((task) {
      DateTime taskDate = DateTime.fromMillisecondsSinceEpoch(task.date);
      if (selectedDate.day == taskDate.day &&
          selectedDate.month == taskDate.month &&
          selectedDate.year == taskDate.year) {
        return true;
      }
      return false;
    }).toList();

    taskList.sort((Task task1, Task task2) {
      DateTime date1 = DateTime.fromMillisecondsSinceEpoch(task1.date);
      DateTime date2 = DateTime.fromMillisecondsSinceEpoch(task2.date);
      return date1.compareTo(date2);
    });

    notifyListeners();
  }

  void setNewSelectedDay(DateTime newDate) {
    selectedDate = newDate;
    getAllTasksFromFireStore();
  }
}
