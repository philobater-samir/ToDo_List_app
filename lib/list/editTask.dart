import 'package:flutter/material.dart';
import 'package:todo_app_course/My_theme_data.dart';

class editTask extends StatelessWidget {
  static const String routeName = 'editTask';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Task',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        toolbarHeight: 80,
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              color: MyThemeData.backgroundColor,
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
                  color: MyThemeData.whiteColor,
                  borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                    child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter Your New Task Title',
                      ),
                      maxLines: 1,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter Your New Task description',
                      ),
                      maxLines: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Select Date : ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300)),
                          GestureDetector(
                            child: InkWell(
                              onTap: () {},
                              child: Text('12 / 4 / 2023',
                                  style: TextStyle(
                                      color: Colors.black,
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
                      onPressed: () {},
                      child: Text(
                        'Edit Task',
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
}
