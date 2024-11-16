import 'dart:io';

import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:read_track_ask/view/screens/edit_profile.dart';
import 'package:read_track_ask/constants/theme.dart';
import 'package:read_track_ask/view/widgets/button.dart';

import '../../services/firebase_operations.dart';
import 'home_screen.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int i = 1;
  File? file;
  @override
  Widget build(BuildContext context) {
    XFile? image =
        Provider.of<FireBaseOpreations>(context, listen: false).theFileImage;
    file = File(image!.path);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
        ),
        title: Text(
          'Profile',
          style: Themes().getheadingStyle(black),
        ),
      ),
      bottomNavigationBar: CircleNavBar(
        onTap: ((index) {
          setState(() {
            i = index;
          });
          i == 0 ? Get.to(() => const HomeScreen()) : Get.to(() => Profile());
        }),
        activeIndex: i,
        activeIcons: const [
          Icon(Icons.more_horiz_sharp, color: Colors.orangeAccent),
          Icon(Icons.person, color: Colors.orangeAccent),
          Icon(Icons.group, color: Colors.orangeAccent),
          Icon(Icons.library_books, color: Colors.orangeAccent),
          Icon(Icons.gps_not_fixed, color: Colors.orangeAccent),
        ],
        inactiveIcons: const [
          Text("More"),
          Text("Profile"),
          Text("Groups"),
          Text("Books"),
          Text("Discover"),
        ],
        color: Colors.white,
        circleColor: Colors.white,
        height: 60,
        circleWidth: 60,

        // tabCurve: ,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        shadowColor: Colors.orangeAccent,
        circleShadowColor: Colors.orangeAccent,
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(10),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CircleAvatar(
                      //backgroundImage: FileImage(file!),
                      child: Image.network(
                        Provider.of<FireBaseOpreations>(context, listen: false)
                            .initUserImage,
                      ),
                    )
                    // child: Provider.of<FireBaseOpreations>(context, listen: false)
                    //         .isUploadUserImage
                    //     ? CircleAvatar(
                    //         backgroundImage: FileImage(
                    //             Provider.of<FireBaseOpreations>(context,
                    //                     listen: false)
                    //                 .userImage!),
                    //       )
                    //     : const Image(
                    //         image: AssetImage('assets/images/profile.png'),
                    //       ),
                    ),
                // Provider.of<FireBaseOpreations>(context, listen: false)
                //         .findUserImage
                //     ? CircleAvatar(
                //         backgroundImage: FileImage(
                //             Provider.of<FireBaseOpreations>(context,
                //                     listen: false)
                //                 .userImage!),
                //       )
                //     : CircleAvatar(
                //         backgroundColor: beige,
                //       )
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Hamzah Salman',
                style: Themes().getheadingStyle(black),
              ),
              Text(
                'hamzahsalmansalman@gmail.com',
                style: Themes().gettitleStyle(black),
              ),
              const SizedBox(
                height: 10,
              ),
              MyButton(
                backgroundColor: beige,
                label: 'Edit Profile',
                textColor: black,
                onTap: () {
                  Get.to(() => const EditProfile());
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              _buildListTile(
                title: 'Settings',
                onPress: () {},
                icon: Icons.settings,
                endIcon: true,
              ),
              _buildListTile(
                title: 'Some things ..',
                onPress: () {},
                icon: Icons.settings,
                endIcon: true,
              ),
              _buildListTile(
                title: 'Some things ..',
                onPress: () {},
                icon: Icons.settings,
                endIcon: true,
              ),
              const Divider(),
              _buildListTile(
                title: 'Information',
                onPress: () {},
                icon: Icons.info_outline_rounded,
                endIcon: true,
              ),
              _buildListTile(
                title: 'Log out',
                onPress: () {},
                icon: Icons.logout,
                endIcon: false,
                textColor: Colors.redAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _buildListTile extends StatelessWidget {
  const _buildListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: grey.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: Colors.orangeAccent,
        ),
      ),
      title: Text(
        title,
        style: Themes().gettitleStyle(textColor ?? black),
      ),
      trailing: endIcon
          ? Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: grey.withOpacity(0.1),
              ),
              child: const Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.orangeAccent,
              ),
            )
          : null,
    );
  }
}
