import 'package:chat_app/controllers/home_controller.dart';
import 'package:chat_app/view/screens/char_room.dart';
import 'package:chat_app/view/screens/feed.dart';
import 'package:chat_app/view/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Get.put(HomeController());
  final PageController homePageController = PageController();
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: homePageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (page) {
          setState(() {
            pageIndex = page;
          });
        },
        children: const [Feed(), ChatRoom(), Profile()],
      ),
      bottomNavigationBar:
          homeController.bottomNavigationBar(pageIndex, homePageController),
    );
  }
}
