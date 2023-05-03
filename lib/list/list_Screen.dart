import 'package:flutter/material.dart';
import 'package:todo_app_course/list/task_widget.dart';

class listScreen extends StatelessWidget {
  const listScreen({Key? key}) : super(key: key);
  static const String routeName = 'listScreen';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return taskWidget();
              },
              itemCount: 3,
            ),
          )
        ],
      ),
    );
  }
}
