import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:read_track_ask/constants/theme.dart';
import 'package:read_track_ask/services/authentication_with_social.dart';
import 'package:read_track_ask/view/screens/Social_home_screen/user_profile.dart';
import 'package:read_track_ask/view/screens/feed_screen/comments_screen.dart';
import 'package:read_track_ask/view/screens/feed_screen/post_fuction.dart';
import 'package:read_track_ask/view/screens/social_profile/social_profile.dart';

class FeedHelper with ChangeNotifier {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('posts')
      .orderBy('time')
      .snapshots();
  File? imageFile;
  Widget feedBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('posts').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SizedBox(
                        width: 400,
                        height: 500,
                        child: CircularProgressIndicator(
                          color: beige,
                        )),
                  );
                } else {
                  return StreamBuilder<QuerySnapshot>(
                    stream: _usersStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: Text("Loading"));
                      }

                      return ListView(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          //imageFile = File(data['user_image']);
                          return Container(
                            padding: const EdgeInsets.all(20.0),
                            height: MediaQuery.of(context).size.height * 0.37,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (data['user_id'] !=
                                            Provider.of<AuthenticationWithSocialMediaApp>(
                                                    context,
                                                    listen: false)
                                                .getUserUid) {
                                          Navigator.pushReplacement(
                                            context,
                                            PageTransition(
                                                child: UserProfile(
                                                    userId:
                                                        data['user_id'] ?? ''),
                                                type: PageTransitionType
                                                    .bottomToTop),
                                          );
                                        } else {
                                          Navigator.pushReplacement(
                                            context,
                                            PageTransition(
                                                child: SocialProfile(
                                                    userId:
                                                        data['user_id'] ?? ''),
                                                type: PageTransitionType
                                                    .bottomToTop),
                                          );
                                        }
                                      },
                                      child: CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage(
                                            data['user_image'] ?? ''),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              data['first_name'] ?? '',
                                              style:
                                                  Themes().gettitleStyle(black),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              data['last_name'] ?? '',
                                              style:
                                                  Themes().gettitleStyle(black),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '${data['time']}',
                                              style: Themes()
                                                  .getsubTitleStyle(grey),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: grey.withOpacity(0.2), 
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      height: 100,
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: Container(
                                        width: 300,
                                        child: Text(data['description'] ?? ''),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Provider.of<PostFunctions>(context,
                                                listen: false)
                                            .addLike(
                                                context,
                                                data['description'],
                                                Provider.of<AuthenticationWithSocialMediaApp>(
                                                        context,
                                                        listen: false)
                                                    .getUserUid)
                                            .whenComplete(
                                                () => print('adding like ...'));
                                      },
                                      child: const Icon(
                                        Icons.favorite_border,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                    StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance
                                          .collection('posts')
                                          .doc(data['description'])
                                          .collection('likes')
                                          .snapshots(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        } else {
                                          return Padding(
                                            padding:
                                                const EdgeInsets.only(left: 8),
                                            child: Text(
                                              snapshot.data!.docs.length
                                                  .toString(),
                                              style: Themes()
                                                  .getsubTitleStyle(black),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        print('comments screen');
                                        Get.to(
                                          () => CommentsScreen(
                                              context: context,
                                              snapshot: document,
                                              docID: data['description']),
                                        );
                                      },
                                      child: const Icon(
                                        Icons.messenger_outline,
                                        color: Colors.amberAccent,
                                      ),
                                    ),
                                    StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance
                                          .collection('posts')
                                          .doc(data['description'])
                                          .collection('comments')
                                          .snapshots(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        } else {
                                          return Padding(
                                            padding:
                                                const EdgeInsets.only(left: 8),
                                            child: Text(
                                              snapshot.data!.docs.length
                                                  .toString(),
                                              style: Themes()
                                                  .getsubTitleStyle(black),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                const Divider(),
                              ],
                            ),
                          );
                        }).toList(),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  // getData() async {
  //   FirebaseFirestore.instance
  //       .collection('posts')
  //       .get()
  //       .then((QuerySnapshot querySnapshot) {
  //     querySnapshot.docs.forEach((doc) {
  //       // print(doc["description"]);
  //       // print(doc["first_name"]);
  //       // print(doc["last_name"]);
  //       // print(doc["email"]);
  //     });
  //   });
  // }
}
