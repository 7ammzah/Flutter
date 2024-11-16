import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_consulting/constants/strings.dart';
import '../../constants/styles.dart';
import '../widgets/contact-info_card.dart';
import '../widgets/costume_scaffold.dart';
import '../widgets/expertises_card.dart';
import '../widgets/image_name_category_card.dart';
import '../widgets/rating.dart';

class ExpertProfileForUser extends StatefulWidget {
  const ExpertProfileForUser({super.key});

  @override
  State<ExpertProfileForUser> createState() => _ExpertProfileForUserState();
}

class _ExpertProfileForUserState extends State<ExpertProfileForUser> {
  bool value = false;
  final expertises = [
    checkBoxState(title: 'Medicine'),
    checkBoxState(title: 'Psychology'),
    checkBoxState(title: 'Family Relation'),
    checkBoxState(title: 'Busniness / management'),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CostumeScaffold(
      isExpert: false,
      showOptions: false,
      title: 'Profile',
      iconData: FontAwesomeIcons.ellipsisVertical,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //TODO: make [image,name,category] together
            ImageNameCategoryHeader(
              isUserProfile: false,
              isExpert: false,
              name: 'Name',
              category: "cat",
            ),
            //TODO: add a Bio card if added
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Rating(),
                ],
              ),
            ),
            //TODO: add Contact info card [email,phoneNumber/if exists]
            ContactInfoCard(
              phoneGiven: true,
              locationGiven: true,
            ),
            //TODO: add Expertises card
            ExpertisesCard(
              isExpert: false,
              children: [],
            ),
            //TODO: add an Appointments card /expert
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppStrings.user_chooce_expertises);
              },
              style: AppButtonStyle.buttonStyle.copyWith(
                  fixedSize:
                      MaterialStateProperty.all(Size(size.width / 2, 20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text(
                    'Add Appointment!',
                    textAlign: TextAlign.center,
                  ),
                  Icon(Icons.edit_calendar_outlined),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future chooce() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(colors: [
                  Color(0XFF8FA8FF),
                  Color(0XFF8FD1FF),
                  Color(0XFF8FD1FF),
                  Color(0XAABFD7FF),
                  Color(0XAABFD7AF),
                ]),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  children: [
                    ...expertises.map(buildSingleCheckBox).toList(),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget buildSingleCheckBox(checkBoxState checkBox) => CheckboxListTile(
        value: checkBox.value,
        title: Text(
          checkBox.title,
          style: const TextStyle(fontSize: 25),
        ),
        onChanged: (value) => setState(() {
          checkBox.value = value!;
        }),
      );
}

class checkBoxState {
  final String title;
  bool value;

  checkBoxState({required this.title, this.value = false});
}
