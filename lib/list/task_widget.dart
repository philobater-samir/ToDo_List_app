import 'package:flutter/material.dart';
import 'package:todo_app_course/My_theme_data.dart';
import 'package:todo_app_course/list/editTask.dart';
import 'package:todo_app_course/modal/task.dart';

class taskWidget extends StatelessWidget {
  Task task;

  taskWidget({required this.task});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(editTask.routeName);
      },
      child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: MyThemeData.whiteColor,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: MyThemeData.primaryColor,
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
                    task.title,
                    style: TextStyle(
                        color: MyThemeData.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    task.description,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 21, vertical: 7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: MyThemeData.primaryColor),
              child: Icon(
                Icons.check,
                size: 25,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
