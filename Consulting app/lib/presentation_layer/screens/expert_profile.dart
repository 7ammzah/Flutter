import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_consulting/constants/strings.dart';
import '../widgets/appointments_card.dart';
import '../widgets/contact-info_card.dart';
import '../widgets/costume_scaffold.dart';
import '../widgets/expertises_card.dart';
import '../widgets/image_name_category_card.dart';
import '../widgets/rating.dart';

class ExpertProfile extends StatelessWidget {
  bool isExpert;

  ExpertProfile({
    required this.isExpert,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const balance = 150;
    return CostumeScaffold(
      isExpert: true,
      showOptions: true,
      title: 'Profile',
      iconData: FontAwesomeIcons.ellipsisVertical,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //TODO: make [image,name,category] together
            ImageNameCategoryHeader(
              isUserProfile: false,
              isExpert: true,
              name: 'Namee',
              //name: 'expert?.getFullName',
              category: "cat",
            ),
            //TODO: add Contact info card [email,phoneNumber/if exists]
            ContactInfoCard(
              phoneGiven: true,
              locationGiven: true,
            ),
            //TODO: add Expertises card
            ExpertisesCard(
              isExpert: true,
              children: [],
            ),
            //TODO: add an Appointments card /expert
            /*
            const AppointmentsCard(
              isExpert: true,
              children: [],
            ),
             */
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppStrings.appointments_expert);
              },
              child: const Text('My Appointment'),
            ),

            Container(
              padding: const EdgeInsets.all(10),
              height: 140,
              width: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    image: AssetImage("assets/images/wallet.png"),
                    fit: BoxFit.fill),
              ),
              child: Container(
                  padding: const EdgeInsets.fromLTRB(230, 90, 10, 10),
                  child: const Text(
                    '$balance\$',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
            isExpert ? Row() : const Rating(),
          ],
        ),
      ),
    );
  }
}
