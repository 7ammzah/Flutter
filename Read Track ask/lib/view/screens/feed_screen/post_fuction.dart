import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:read_track_ask/constants/theme.dart';
import 'package:read_track_ask/services/authentication_with_social.dart';
import 'package:read_track_ask/services/firebase_operations.dart';

class PostFunctions with ChangeNotifier {
  Future addLike(BuildContext context, String postId, String subDocId) async {
    return FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(subDocId)
        .set({
      'likes': FieldValue.increment(1),
      'first_name': Provider.of<FireBaseOpreations>(context, listen: false)
          .getInitFirstName,
      'last_name': Provider.of<FireBaseOpreations>(context, listen: false)
          .getInitLastName,
      'user_id':
          Provider.of<AuthenticationWithSocialMediaApp>(context, listen: false)
              .getUserUid,
      'user_image': Provider.of<FireBaseOpreations>(context, listen: false)
          .getInitUserImage,
      'email': Provider.of<FireBaseOpreations>(context, listen: false)
          .getInitUserEmail,
      'time': DateFormat.yMMMEd().format(DateTime.now()),
    });
  }

  Future addComment(BuildContext context, String postId, String comment) async {
    await FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .doc(comment)
        .set({
      'comment': comment,
      'first_name': Provider.of<FireBaseOpreations>(context, listen: false)
          .getInitFirstName,
      'last_name': Provider.of<FireBaseOpreations>(context, listen: false)
          .getInitLastName,
      'user_id':
          Provider.of<AuthenticationWithSocialMediaApp>(context, listen: false)
              .getUserUid,
      'user_image': Provider.of<FireBaseOpreations>(context, listen: false)
          .getInitUserImage,
      'email': Provider.of<FireBaseOpreations>(context, listen: false)
          .getInitUserEmail,
      'time': DateFormat.yMMMEd().format(DateTime.now()),
    });
  }

  Future showComments(
      BuildContext context, DocumentSnapshot snapshot, String docID) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width,
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('posts')
                .doc(docID)
                .collection('comments')
                .orderBy('time')
                .snapshots(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;

                  return Container(
                    padding: const EdgeInsets.all(20.0),
                    height: MediaQuery.of(context).size.height * 0.11,
                    width: MediaQuery.of(context).size.width,
                    color: orange,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              child: ClipRRect(
                                child: data['first_name'] == null
                                    ? const CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.amberAccent,
                                      )
                                    : Container(
                                        width: 30,
                                        height: 30,
                                        color: Colors.greenAccent,
                                        child: Image.network(
                                            data['user_image'] ?? ''),
                                      ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      data['first_name'] ?? '',
                                      style: Themes().gettitleStyle(black),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      data['last_name'] ?? '',
                                      style: Themes().gettitleStyle(black),
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
                              color: grey,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 100,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Container(
                                width: 300,
                                child: Text(data['comment'] ?? ''),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            }),
          ),
        );
      },
    );
  }
}
