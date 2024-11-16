import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../widgets/background.dart';


class ExpertInScreen extends StatefulWidget {
  const ExpertInScreen({Key? key}) : super(key: key);

  @override
  State<ExpertInScreen> createState() => _ExpertInScreenState();
}

class _ExpertInScreenState extends State<ExpertInScreen> {
  bool value = false;
  final expertises = [
    checkBoxState(title: 'Medicine'),
    checkBoxState(title: 'Psychology'),
    checkBoxState(title: 'Family Relation'),
    checkBoxState(title: 'Busniness / management'),
  ];

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
                  height: 200,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 30),
                  child: const Text(
                    "Expert IN",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "SourceSansPro",
                        fontSize: 35,
                        color: Colors.blueAccent),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
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
                      padding: const EdgeInsets.symmetric(vertical: 20 , horizontal: 20),
                    child: Column(
                        children: [
                          ...expertises.map(buildSingleCheckBox).toList(),
                        ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppStrings.expert_book);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          'Next Page',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColor.BlueColor,
                          ),
                        ),
                        SizedBox(width: 20,),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildSingleCheckBox(checkBoxState checkBox) =>
      CheckboxListTile(
        value: checkBox.value,
        title: Text(
          checkBox.title,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
        ),
        onChanged: (value) =>
            setState(() {
              checkBox.value = value!;
            }),
      );
}

class checkBoxState {
  final String title;
  bool value;

  checkBoxState({
    required this.title,
    this.value = false
  });
}