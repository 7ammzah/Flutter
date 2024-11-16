import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do/services/notification_services.dart';
import 'package:to_do/services/theme_services.dart';
import 'package:to_do/ui/pages/add_task_page.dart';
import 'package:to_do/ui/pages/notification_screen.dart';
import 'package:to_do/ui/size_config.dart';
import 'package:to_do/ui/widgets/button.dart';
import 'package:intl/intl.dart';
import 'package:to_do/ui/widgets/task_tile.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../controllers/task_controller.dart';
import '../../models/task.dart';
import '../theme.dart';
import '../widgets/input_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //@override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   NotifyHelper.Initializ(flutterLocalNotificationsPlugin);
  // }

  final TaskController taskController = Get.put(TaskController());
  Task task = Task();
  DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Get.isDarkMode ? Icons.wb_sunny : Icons.nightlight_round_outlined,
            color: Get.isDarkMode ? white : darkGreyClr,
          ),
          onPressed: () {
            ThemeServices().switchTheme();
            // NotificationService().showNotification(
            //   title: 'Title',
            //   body: 'Theme was changed',
            // );
            //NotifyHelper().displayNotification(title: 'Title', body: 'body of notification');
            //notifyHelper.scedualNotifications(1, 3, task);
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
      body: Column(
        children: [
          taskBar(),
          dateBar(),
          const SizedBox(
            height: 10,
          ),
          showMessage(),
          //showTasks(),
        ],
      ),
    );
  }

  Widget taskBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: Themes().subHeadingStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Today',
                style: Themes().headingStyle,
              )
            ],
          ),
          MyButton(
              label: '+ Add Task',
              onTap: () async {
                await Get.to(() => const AddTaskPage());
                taskController.getTasks();
              })
        ],
      ),
    );
  }

  Widget dateBar() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: DatePicker(
        DateTime.now(),
        width: 70,
        height: 101,
        initialSelectedDate: dateTime,
        selectedTextColor: white,
        selectionColor: purpleClr,
        onDateChange: (selectedDate) => setState(() {
          dateTime = selectedDate;
        }),
        dayTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
        dateTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  showTasks() {
    return Expanded(
      child: ListView.builder(
        scrollDirection: SizeConfig.orientation == Orientation.landscape
            ? Axis.horizontal
            : Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          task = taskController.tsakList[index];
          var hour = task.startTime.toString().split(':')[0];
          var minutes = task.startTime.toString().split(':')[1];
          var date = DateFormat.jm().parse(task.startTime!);
          var Mydate = DateFormat('HH:mm').format(date);
          // NotifyHelper().scheduledNotification(
          //     int.parse(Mydate.toString().split(':')[0]),
          //     int.parse(Mydate.toString().split(':')[1]),
          //     task);
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 1375),
            child: SlideAnimation(
              horizontalOffset: 300,
              child: FadeInAnimation(
                child: GestureDetector(
                  onTap: () {
                    showBottomSheet(context, task);
                  },
                  child: TaskTile(task),
                ),
              ),
            ),
          );
        },
        itemCount: taskController.tsakList.length,
      ),
    );

    // //child: showMessage(),
    // child: Obx(() {
    //   return taskController.tsakList.isEmpty ? showMessage() : Container();
    // }),
  }

  showMessage() {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 2000),
          child: SingleChildScrollView(
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.vertical,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        SvgPicture.asset(
                          'assets/images/task.svg',
                          height: 100,
                          color: purpleClr.withOpacity(0.5),
                          semanticsLabel: 'task',
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          'You don\'t have any task yet!',
                          style: Themes().subTitleStyle,
                        ),
                        Text(
                          'Add new tasks to make your days productive.',
                          style: Themes().subTitleStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  buildBottomSheet({
    required String label,
    required Function() onTap,
    required Color clr,
    bool isClose = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 60,
        width: SizeConfig.screenWidth * 0.9,
        decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: isClose
                  ? Get.isDarkMode
                      ? Colors.grey[600]!
                      : Colors.grey[300]!
                  : clr,
            ),
            borderRadius: BorderRadius.circular(20),
            color: isClose ? Colors.transparent : clr),
        child: Center(
            child: Text(
          label,
          style: Themes().titleStyle,
        )),
      ),
    );
  }

  showBottomSheet(BuildContext context, Task task) {
    Get.bottomSheet(SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 4),
        width: SizeConfig.screenWidth,
        height: SizeConfig.orientation == Orientation.landscape
            ? (task.isCompleted == 1
                ? SizeConfig.screenHeight * 0.6
                : SizeConfig.screenHeight * 0.8)
            : (task.isCompleted == 1
                ? SizeConfig.screenHeight * 0.30
                : SizeConfig.screenHeight * 0.39),
        color: Get.isDarkMode ? darkGreyClr : white,
        child: Column(
          children: [
            Flexible(
              child: Container(
                height: 6,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color:
                        Get.isDarkMode ? Colors.grey[600]! : Colors.grey[300]!),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            task.isCompleted == 1
                ? Container()
                : buildBottomSheet(
                    label: 'Task Completed', onTap: () {}, clr: purpleClr),
            Divider(
              color: Get.isDarkMode ? darkGreyClr : white,
            ),
            buildBottomSheet(
                label: 'Delete Completed', onTap: () {}, clr: purpleClr),
            Divider(
              color: Get.isDarkMode ? darkGreyClr : white,
            ),
            buildBottomSheet(label: 'Cancel', onTap: () {}, clr: purpleClr),
          ],
        ),
      ),
    ));
  }
}
