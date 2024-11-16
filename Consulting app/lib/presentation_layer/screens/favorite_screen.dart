import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:new_consulting/constants/strings.dart';

import '../../constants/colors.dart';

class FavoritesScreen extends StatefulWidget {
  FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
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
          title: const Text('Favorite Screen'),
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
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  InkWell(
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/images/user.png"),
                      radius: 50,
                    ),
                    onTap: (){
                      Navigator.pushNamed(context, AppStrings.expertprofiletouser);
                    },
                  ),
                  Column(
                  children: const [
                    Text('Name'),
                    Text('Category'),
                  ],
                  ),
                  const Padding(
                      padding: EdgeInsets.fromLTRB(190, 10, 10, 10),
                    child: Icon(Icons.favorite , color: Colors.red,),
                  ),
                ],
              ),
            ),
          );
        },
      );
}
