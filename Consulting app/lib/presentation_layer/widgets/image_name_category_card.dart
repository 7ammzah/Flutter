import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import '../../constants/constants.dart';

class ImageNameCategoryHeader extends StatelessWidget {
  final String name;
  final String category;
  final bool isExpert;
  final bool isUserProfile;

  ImageNameCategoryHeader({
    required this.name,
    required this.category,
    required this.isExpert,
    required this.isUserProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        textBaseline: TextBaseline.ideographic,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/images/user.png"),
                  radius: 50,
                ),
              ),
              !isUserProfile & !isExpert
              ?Row(
                children: const [
                  Text(
                    '4.5',
                    style: TextStyle(
                        fontSize: 30
                    ),
                  ),
                  Icon((Icons.star) , color: Colors.amber , size: 40,),
                ],
              ):
              Row(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: kNameTextStyle.copyWith(
                    color: kDarkColor,
                  ),
                ),
                Text(
                  category,
                  style: const TextStyle(color: kDarkColor),
                ),
              ],
            ),
          ),
          isExpert | isUserProfile
              ? Row()
              : Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(140, 10, 20, 100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            //color: Colors.amber,
                            width: 40,
                            height: 40,
                            child: FavoriteButton(
                              valueChanged: (_) {},
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                )
        ],
      ),
    );
  }
}
