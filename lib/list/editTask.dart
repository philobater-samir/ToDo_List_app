import 'package:flutter/material.dart';
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
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      task = ModalRoute.of(context)?.settings.arguments as Task;
      titleController.text = task.title;
      descriptionController.text = task.description;
      selectedDate = DateTime.fromMillisecondsSinceEpoch(task.date);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                      controller: titleController,
                      decoration: InputDecoration(
                        labelText: 'Enter Your New Task Title',
                      ),
                      maxLines: 1,
                    ),
                    TextFormField(
                      controller: descriptionController,
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
                              onTap: () {
                                chooseDate();
                              },
                              child: Text(
                                  '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
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
