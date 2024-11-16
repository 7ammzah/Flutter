import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_consulting/constants/strings.dart';
import '../../business_logic_layer/cubit/consulting_cubit.dart';
import '../../constants/constants.dart';
import '../screens/addAppointments.dart';
import '../widgets/profile_info_card.dart';
import '../../data_layer/models/field.dart';

class AppointmentsCard extends StatefulWidget {
  final bool isExpert;
  final List<Widget> children;

  const AppointmentsCard({
    super.key,
    required this.children,
    required this.isExpert,
  });

  @override
  State<AppointmentsCard> createState() => _AppointmentsCardState();
}

class _AppointmentsCardState extends State<AppointmentsCard> {
  final String title = "Appointments";
  Field field = Field(title: '', id: 0);
  List<Field>? fields = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: kLightModerateColor,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: kShiningElevation,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            //color: kModerateColor,
            decoration: BoxDecoration(
              color: kModerateColor,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: kNameTextStyle,
                ),
                widget.isExpert
                    ?
                Row()
                    :IconButton(
                  onPressed: () {
                    selectExpertises();
                    //Navigator.pushNamed(context, AppStrings.booking_calender);
                  },
                  icon: const Icon(Icons.add_circle),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: kModerateColor,
                  width: 5,
                ),
              ),
            ),
            child: Column(
              children: widget.children,
            ),
          ),
        ],
      ),
    );
  }
  Future selectExpertises() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0XFF8FA8FF),
                      Color(0XFF8FD1FF),
                      Color(0XFF8FD1FF),
                      Color(0XAABFD7FF),
                      Color(0XAABFD7AF),
                    ],
                  )),
              height: 150,
              width: 360,
              //child : buildLoadingFields(),
              child: Column(
                children: [ Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 500,
                      height: 90,
                      child: buildLoadingFields(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(220, 10, 10, 20),
                      child: GestureDetector(
                        child:  const Text(
                            'OK',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        onTap: (){
                          Navigator.pushNamed(context, AppStrings.booking_calender);
                        },
                      ),
                    ),
                  ],
                ),
                ],
              )
            ),
          );
        });
  }
  Container buildLoadingFields() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: DropdownButtonFormField(
        hint: const Text("Chooce an Expert"),
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.explicit),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple),
          ),
        ),
        items: [
          Field(title: 'Medicine', id: 1),
          Field(title: "Psychology", id: 2),
          Field(title: "Family Relations", id: 3),
          Field(title: "Business / management", id: 4)
        ]
            .map(
              (field) => DropdownMenuItem<int>(
            value: field.id,
            child: Text(field.title!),
          ),
        )
            .toList(),
        onChanged: (value) {
          setState(() {
            print(value);
            field.id = value;
          });
        },
      ),
    );
  }
}

