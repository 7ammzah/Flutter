import 'package:flutter/material.dart';

import 'colors.dart';
import 'strings.dart';
import 'styles.dart';

class NavigationDrawer extends StatefulWidget {
  final bool isExpert;

  const NavigationDrawer({
    super.key,
    required this.isExpert,
  });

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  bool lang = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItem(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: kElevationToShadow[2],
        color: AppColor.moderateColor,
      ),
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          CircleAvatar(
            //TODO: add Elevation
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/images/user.png"),
            radius: 60,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Name",
            style: AppTextStyle.nameTextStyle,
          ),
          Text(
            "category",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text("Browsing Experts"),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, AppStrings.browsingScreen);
            },
          ),
          Divider(
            thickness: 1,
            color: AppColor.moderateColor.withAlpha(200),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline_outlined),
            title: const Text("Profile"),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              widget.isExpert
                  ? Navigator.pushReplacementNamed(
                      context, AppStrings.expertProfile)
                  : Navigator.pushReplacementNamed(
                      context, AppStrings.clientProfile);
            },
          ),
          Divider(
            thickness: 1,
            color: AppColor.moderateColor.withAlpha(200),
          ),
          ListTile(
            leading: const Icon(Icons.chat_outlined),
            title: const Text("chats"),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider(
            thickness: 1,
            color: AppColor.moderateColor.withAlpha(200),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline_outlined),
            title: const Text("My Favorite"),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // isExpert
              //     ? Navigator.pushNamed(context, ExpertProfile.id)
              //     : Navigator.pushNamed(context, ClientProfile.id);
              Navigator.pushNamed(context, AppStrings.favoritescreen);
            },
          ),
          Divider(
            thickness: 1,
            color: AppColor.moderateColor.withAlpha(200),
          ), ListTile(
            leading: const Icon(Icons.edit),
            title: const Text("Change Language"),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
             setState(() {
               lang = !lang;
             });
            },
          ),
          Divider(
            thickness: 1,
            color: AppColor.moderateColor.withAlpha(200),
          ),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text("Log out"),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.pushReplacementNamed(context, AppStrings.loginScreen);
            },
          ),
          Divider(
            thickness: 1,
            color: AppColor.moderateColor.withAlpha(200),
          ),
        ],
      ),
    );
  }
}
