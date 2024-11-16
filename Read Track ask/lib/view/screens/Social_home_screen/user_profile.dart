import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:read_track_ask/constants/theme.dart';
import 'package:read_track_ask/view/screens/Social_home_screen/social_home.dart';
import 'package:read_track_ask/view/screens/Social_home_screen/user_profile_helper.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({required this.userId, super.key});

  final String userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.amberAccent,
          ),
        ),
        title: Text(
          'User Profile',
          style: Themes().getheadingStyle(black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(userId)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Text('still waiting ...'),
                );
              } else {
                return Column(
                  children: [
                    Provider.of<UserProfileHelper>(context, listen: false)
                        .headerProfile(context, snapshot, userId),
                    const Divider(),
                    Provider.of<UserProfileHelper>(context, listen: false)
                        .middleProfile(context, snapshot, userId)
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
