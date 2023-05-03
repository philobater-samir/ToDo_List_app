import 'package:flutter/material.dart';
import 'package:todo_app_course/My_theme_data.dart';

class taskWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: MyThemeData.whiteColor,
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: MyThemeData.prinaryColor,
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
                  'Play football',
                  style: TextStyle(
                      color: MyThemeData.prinaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 15,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      '12 : 30 Pm',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 21, vertical: 7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: MyThemeData.prinaryColor),
            child: Icon(
              Icons.check,
              size: 25,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
