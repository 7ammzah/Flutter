import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:read_track_ask/services/authentication_with_social.dart';
import 'package:read_track_ask/services/firebase_operations.dart';
import 'package:read_track_ask/view/widgets/button.dart';

import '../../../constants/theme.dart';

class UserProfileHelper with ChangeNotifier {
  Widget headerProfile(BuildContext context, dynamic snapshot, String userId) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            //height: 280,
            width: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          NetworkImage(snapshot.data.data()['image']),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        snapshot.data.data()['first_name'],
                        style: Themes().gettitleStyle(black),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        snapshot.data.data()['last_name'],
                        style: Themes().gettitleStyle(black),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: MyButton(
                    label: 'Follow',
                    textColor: white,
                    backgroundColor: Colors.lightBlueAccent,
                    onTap: () {
                      Provider.of<FireBaseOpreations>(context, listen: false)
                          .followUser(
                              userId,
                              Provider.of<AuthenticationWithSocialMediaApp>(
                                      context,
                                      listen: false)
                                  .getUserUid,
                              {
                                'first_name': Provider.of<FireBaseOpreations>(
                                        context,
                                        listen: false)
                                    .getInitFirstName,
                                'last_name': Provider.of<FireBaseOpreations>(
                                        context,
                                        listen: false)
                                    .getInitLastName,
                                'image': Provider.of<FireBaseOpreations>(
                                        context,
                                        listen: false)
                                    .getInitUserImage,
                                'email': Provider.of<FireBaseOpreations>(
                                        context,
                                        listen: false)
                                    .getInitUserEmail,
                                'time': Timestamp.now(),
                              },
                              Provider.of<AuthenticationWithSocialMediaApp>(
                                      context,
                                      listen: false)
                                  .getUserUid,
                              userId,
                              {
                                'first_name':
                                    snapshot.data.data()['first_name'],
                                'last_name': snapshot.data.data()['last_name'],
                                'image': snapshot.data.data()['image'],
                                'email': snapshot.data.data()['email'],
                                'user_id': snapshot.data.data()['user_id'],
                                'time': Timestamp.now()
                              })
                          .whenComplete(() => print('done!!!!!!!!'));
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget middleProfile(BuildContext context, dynamic snapshot, String userID) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: grey.withOpacity(0.1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Following',
                    style: Themes().gettitleStyle(Colors.blueAccent),
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(userID)
                        .collection('following')
                        .snapshots(),
                    builder: (context, snapshot) {
                      // print('${snapshot.data.data()['user_id']}');
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Text(
                        snapshot.data!.docs.length.toString(),
                        style: Themes().gettitleStyle(black),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: grey.withOpacity(0.1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Followers',
                    style: Themes().gettitleStyle(Colors.blueAccent),
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(userID)
                        .collection('follower')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Text(
                        snapshot.data!.docs.length.toString(),
                        style: Themes().gettitleStyle(black),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: grey.withOpacity(0.1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Posts',
                    style: Themes().gettitleStyle(Colors.blueAccent),
                  ),
                  Text('0', style: Themes().gettitleStyle(black))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
