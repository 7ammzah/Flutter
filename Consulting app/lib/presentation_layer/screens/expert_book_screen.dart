import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants/strings.dart';
import '../../constants/styles.dart';
import '../widgets/background.dart';

class ExpertBookTime extends StatefulWidget {
  const ExpertBookTime({Key? key}) : super(key: key);

  @override
  State<ExpertBookTime> createState() => _ExpertBookTimeState();
}

class _ExpertBookTimeState extends State<ExpertBookTime> {
  final items = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
  int index = 0;
  TimeOfDay _timeOfDayStart = TimeOfDay.now();
  TimeOfDay _timeOfDayEnd = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          Background(
            child: Column(
              children: [
                Container(
                  //color: Colors.amber,
                  height: 120,
                  alignment: Alignment.centerLeft,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: const Text(
                    "Your Appointments",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "SourceSansPro",
                        fontSize: 25,
                        color: Colors.blueAccent),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 120,
                ),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0XFF8FA8FF),
                        Color(0XFF8FD1FF),
                        Color(0XFF8FD1FF),
                        Color(0XAABFD7FF),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 20),
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              items[index],
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'Pacifico'
                              ),
                            ),
                            SizedBox(
                              height: 150,
                              child: CupertinoPicker(
                                itemExtent: 53,
                                children: items
                                    .map(
                                      (e) =>
                                      Center(
                                        child: Text(e),
                                      ),
                                )
                                    .toList(),
                                onSelectedItemChanged: (index) {
                                  setState(() {
                                    this.index = index;
                                    final e = items[index];
                                  });
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 50,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      final time = await pickTimeStart();
                                      if(time == null) return;
                                    },
                                    style: AppButtonStyle.buttonStyle,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Text('Start in :'),
                                        Text(_timeOfDayStart.format(context).toString())
                                      ],
                                    )
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        final time = await pickTimeEnd();
                                        if(time == null) return;
                                      },
                                      style: AppButtonStyle.buttonStyle,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Text('End in :'),
                                          Text(_timeOfDayEnd.format(context).toString())
                                        ],
                                      )
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppStrings.expertProfile);
                    },
                    style: AppButtonStyle.buttonStyle,
                    child: const Text(
                      'Register',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<TimeOfDay?> pickTimeStart() =>
      showTimePicker(
        context: context,
        initialTime:  TimeOfDay.now(),
      ).then((value) {
        setState(() {
          _timeOfDayStart = value!;
        });
      });
  Future<TimeOfDay?> pickTimeEnd() =>
      showTimePicker(
        context: context,
        initialTime:  TimeOfDay.now(),
      ).then((value) {
        setState(() {
          _timeOfDayEnd = value!;
        });
      });
}
