import 'package:flutter/material.dart';
import 'package:to_do/ui/size_config.dart';
import 'package:to_do/ui/theme.dart';

import '../../models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(this.task, {Key? key}) : super(key: key);

  final Task task;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(
            SizeConfig.orientation == Orientation.landscape ? 8 : 20 ),
            vertical: 5
      ),
      width: SizeConfig.orientation == Orientation.landscape
          ? SizeConfig.screenWidth / 2
          : SizeConfig.screenWidth,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: getColor(task.color),
        ),
        child: Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(task.title!, style: Themes().headingStyle),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.access_time_rounded),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${task.startTime} - ${task.endTime}',
                          style: Themes().titleStyle,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(task.note!, style: Themes().subTitleStyle)
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              height: 60,
              width: 0.5,
              color: Colors.grey[200]!.withOpacity(0.7),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                task.isCompleted == 0 ? 'TO DO' : 'Completed',
                style: Themes().titleStyle,
              ),
            ),        
          ],
        ),
      ),
    );
  }

  getColor(int? color) {
    switch (color) {
      case 0:
        return purpleClr;
      case 1:
        return pinkClr;
      case 2:
        return yellowClr;
      default:
        return purpleClr;
    }
  }
}
