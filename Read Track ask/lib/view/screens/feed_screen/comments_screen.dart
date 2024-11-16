import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:read_track_ask/view/screens/feed_screen/post_fuction.dart';

import '../../../constants/theme.dart';

class CommentsScreen extends StatelessWidget {
  CommentsScreen(
      {required this.context,
      required this.snapshot,
      required this.docID,
      super.key});
  BuildContext context;
  DocumentSnapshot snapshot;
  String docID;

  @override
  Widget build(BuildContext context) {
    // Map<String, dynamic> data = {'': ''};
    TextEditingController commentController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
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
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                    child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      NetworkImage(data['user_image'] ?? ''),
                                )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          data['first_name'] ?? 'hamzah',
                                          style: Themes().gettitleStyle(black),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          data['last_name'] ?? 'salman',
                                          style: Themes().gettitleStyle(black),
                                        ),
                                      ],
                                    ),
                                    Text(data['time'] ?? ''),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: grey.withOpacity(0.1),
                                  ),
                                  child: Text(data['comment'] ?? ''),
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
            ),
            Container(
              padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.7),
              child: TextField(
                controller: commentController,
                decoration: InputDecoration(
                  hintText: "add a comment ...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                  ),
                  suffixIcon: Container(
                    margin: const EdgeInsets.all(8),
                    child: FloatingActionButton(
                      child: const Icon(Icons.messenger_outline_outlined),
                      onPressed: () {
                        Provider.of<PostFunctions>(context, listen: false)
                            .addComment(context, docID, commentController.text)
                            .whenComplete(() {
                          print('adding a commint');
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
