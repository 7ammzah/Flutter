
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:read_track_ask/view/screens/feed_screen/feed_helper.dart';
import 'package:read_track_ask/view/screens/feed_screen/upload_post.dart';

import '../../../constants/theme.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  CollectionReference posts = FirebaseFirestore.instance.collection('posts');
  final PageController pageController = PageController();

  var users;
  gett() async {
    var response = await posts.get();
    response.docs.forEach((element) {
      setState(() {
        users.add(element.data());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Feeds',
          style: Themes().gettitleStyle(black),
        ),
        leading: IconButton(
          onPressed: () {
            Get.off(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await Provider.of<UploadPost>(context, listen: false)
                    .editPostSheet(context);
              },
              icon: const Icon(
                Icons.add_comment_outlined,
              ))
        ],
      ),
      body: Provider.of<FeedHelper>(context, listen: false).feedBody(context),
      //body:
    );
  }
}

//title: Text(data['first_name'] ?? 'null'),
//subtitle: Text(data['description'] ?? 'null'),

