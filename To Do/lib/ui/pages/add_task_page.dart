import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:to_do/controllers/task_controller.dart';
import 'package:to_do/models/task.dart';
import 'package:to_do/ui/pages/home_page.dart';
import 'package:to_do/ui/theme.dart';
import 'package:to_do/ui/widgets/button.dart';

import '../../services/theme_services.dart';
import '../widgets/input_field.dart';
import 'notification_screen.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController taskController = Get.put(TaskController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  DateTime dateTime = DateTime.now();
  String startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)))
      .toString();
  int selectedRemind = 5;
  List<int> remindList = [5, 10, 15];
  String selectedRepeat = 'None';
  List<String> repeatList = ['None ', 'Daily', 'Weekly', 'Monthly'];
  int selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: purpleClr,
          ),
          onPressed: () {
            Get.to(const HomePage());
          },
        ),
        elevation: 0,
        backgroundColor: context.theme.backgroundColor,
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/person.jpeg'),
              radius: 20,
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Add Task',
                style: Themes().headingStyle,
              ),
              InputField(
                title: 'Title',
                hint: 'enter the title',
                controller: titleController,
              ),
              InputField(
                title: 'Note',
                hint: 'type your note here',
                controller: noteController,
              ),
              InputField(
                title: 'Date',
                hint: DateFormat.yMd().format(dateTime),
                widget: IconButton(
                  icon: const Icon(Icons.calendar_today_outlined),
                  onPressed: () {
                    getDate();
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InputField(
                      title: 'Start Time',
                      hint: startTime,
                      widget: IconButton(
                        icon: const Icon(
                          Icons.access_time_rounded,
                        ),
                        onPressed: () {
                          getTime(isStartTime: true);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: InputField(
                      title: 'End Time',
                      hint: endTime,
                      widget: IconButton(
                        icon: const Icon(
                          Icons.access_time_rounded,
                        ),
                        onPressed: () {
                          getTime(isStartTime: false);
                        },
                      ),
                    ),
                  )
                ],
              ),
              InputField(
                title: 'Reminder',
                hint: '$selectedRemind minutes early',
                widget: DropdownButton(
                  borderRadius: BorderRadius.circular(12),
                  onChanged: (value) {
                    setState(() {
                      selectedRemind = value!;
                    });
                  },
                  items: remindList
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            '$e',
                            style: Themes().subTitleStyle,
                          ),
                        ),
                      )
                      .toList(),
                  icon: const Icon(Icons.keyboard_arrow_down),
                ),
              ),
              InputField(
                title: 'Repeat',
                hint: selectedRepeat,
                widget: DropdownButton(
                  borderRadius: BorderRadius.circular(12),
                  items: repeatList
                      .map<DropdownMenuItem<String>>(
                        (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: Themes().subTitleStyle,
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedRepeat = value!;
                    });
                  },
                  icon: const Icon(Icons.keyboard_arrow_down),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Color',
                        style: Themes().titleStyle,
                      ),
                      Wrap(
                          children: List.generate(
                        3,
                        (index) => GestureDetector(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: CircleAvatar(
                              backgroundColor: index == 0
                                  ? purpleClr
                                  : index == 1
                                      ? pinkClr
                                      : yellowClr,
                              child: selectedColor == index
                                  ? const Icon(
                                      Icons.done,
                                      size: 30,
                                      color: white,
                                    )
                                  : null,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              selectedColor = index;
                            });
                          },
                        ),
                      )),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 96,
                        alignment: Alignment.center,
                        child: MyButton(
                          label: 'Creat Task',
                          onTap: () {
                            validity();
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  addTaskToDB() async {
    int value = await TaskController().addTask(
        task: Task(
            title: titleController.text,
            note: noteController.text,
            isCompleted: 0,
            date: DateFormat.yMd().format(dateTime),
            startTime: startTime,
            endTime: endTime,
            color: selectedColor,
            remind: selectedRemind,
            repeat: selectedRepeat));
  }

  validity() {
    if (titleController.text.isNotEmpty && noteController.text.isNotEmpty) {
      addTaskToDB();
      Get.back();
    } else if (titleController.text.isEmpty || noteController.text.isEmpty) {
      Get.snackbar(
        'Required',
        'Please check all fields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.isDarkMode ? darkGreyClr : white,
        colorText: Get.isDarkMode ? white : darkGreyClr,
        icon: const Icon(
          Icons.warning_amber_rounded,
          color: Colors.red,
        ),
      );
    }
  }

  void getDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(2020),
        lastDate: DateTime(2099),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
                primarySwatch: Colors.deepPurple,
                cardColor: Get.isDarkMode ? Colors.grey[400]! : white),
            child: child!,
          );
        });
    if (pickedDate != null) {
      setState(() {
        dateTime = pickedDate;
      });
    }
  }

  void getTime({required bool isStartTime}) async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: isStartTime
            ? TimeOfDay.fromDateTime(DateTime.now())
            : TimeOfDay.fromDateTime(
                DateTime.now().add(const Duration(minutes: 15)),
              ),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData(
                primarySwatch: Colors.deepPurple,
                cardColor: Get.isDarkMode ? Colors.grey[400]! : white),
            child: child!,
          );
        });

    String timePicked = pickedTime!.format(context);
    if (pickedTime != null) {
      setState(() {
        isStartTime ? startTime = timePicked : endTime = timePicked;
      });
    }
  }
}
