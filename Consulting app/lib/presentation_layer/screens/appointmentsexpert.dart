import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:new_consulting/constants/strings.dart';

import '../../constants/colors.dart';

class AppointmentsExperts extends StatefulWidget {
  AppointmentsExperts({Key? key}) : super(key: key);

  @override
  State<AppointmentsExperts> createState() => _AppointmentsExpertsState();
}

class _AppointmentsExpertsState extends State<AppointmentsExperts> {
  final List items = [
    'Name',
    'Name',
    'Name',
    'Name',
    'Name',
    'Name',
    'Name',
    'Name',
    'Name',
    'Name',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MyAppointments'),
          backgroundColor: AppColor.moderateColor,
        ),
        body: buildList());
  }

  Widget buildList() => GridView.builder(

    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 1,
      childAspectRatio: 3,
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,
    ),

    itemCount: items.length,
    itemBuilder: (_, index) {
      return SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20)
          ),
          padding: EdgeInsets.all(14),
          child: Row(
            children: [
              InkWell(
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/images/user.png"),
                  radius: 50,
                ),
                onTap: (){
                 Navigator.pushNamed(context, AppStrings.clientProfile);
                },
              ),
              Container(
                width: 100,
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text('Client Name'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text('Mon'),
                        Text('Day'),
                        Text('00:00'),
                      ],
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      );
    },
  );
}
