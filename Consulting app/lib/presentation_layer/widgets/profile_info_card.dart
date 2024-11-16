import 'package:flutter/material.dart';
import 'package:new_consulting/presentation_layer/widgets/our_text-field.dart';
import '../../constants/constants.dart';

class ProfileInfoCard extends StatelessWidget {
  TextEditingController bio = TextEditingController();
  final String title;
  final List<Widget> children;
  final bool isExpertises;

  ProfileInfoCard({
    required this.title,
    required this.children,
    required this.isExpertises,
  });

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
                isExpertises
                    ?IconButton(onPressed: (){
                      editExperts(context);
                }, icon: const Icon(Icons.edit))
                    :Row(),
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
              children: children,
            ),
          ),
        ],
      ),
    );
  }
  Future editBio(BuildContext context){
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
              height: 120,
              width: 360,
              child: Column(
                children:  [
                  const Text(
                    'Edit Bio!',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Pacifico"),
                  ),
                  OurTextField(
                      type: TextInputType.text,
                      label: 'add bio',
                      iconData: Icons.currency_bitcoin_outlined,
                      hint: 'add bio',
                      controller: bio)
                ],
              ),
            ),
          );
        });
  }

  Future editExperts(BuildContext context){
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
              height: 120,
              width: 360,
              child: Column(
                children:  [
                  const Text(
                    'Edit Experts!',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Pacifico"),
                  ),
                  OurTextField(
                      type: TextInputType.text,
                      label: 'add expertience',
                      iconData: Icons.currency_bitcoin_outlined,
                      hint: 'add expertience',
                      controller: bio)
                ],
              ),
            ),
          );
        });
  }
}

