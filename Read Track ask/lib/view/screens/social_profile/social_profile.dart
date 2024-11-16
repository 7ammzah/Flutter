import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:read_track_ask/services/authentication_with_social.dart';

import '../../../constants/theme.dart';
import '../signing_in_flow/login_screen.dart';
import 'profile_helper.dart';

class SocialProfile extends StatelessWidget {
  SocialProfile({super.key, required this.userId});
  final String userId;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<AuthenticationWithSocialMediaApp>(context,
                        listen: false)
                    .logOut();
                Get.offAll(const LogInScreen());
              },
              icon: const Icon(Icons.logout))
        ],
        title: Text(
          'My Profile',
          style: Themes().gettitleStyle(black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(Provider.of<AuthenticationWithSocialMediaApp>(context,
                          listen: false)
                      .getUserUid)
                  .snapshots(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Provider.of<ProfileHelper>(context, listen: false)
                          .headerProfile(context, snapshot),
                      Provider.of<ProfileHelper>(context, listen: false)
                          .middleProfile(context, snapshot, userId),
                    ],
                  );
                }
              }),
            ),
          ),
        ),
      ),
    );
  }
}
