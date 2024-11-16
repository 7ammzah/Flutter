import 'package:chat_app/controllers/home_controller.dart';
import '../../view/screens/char_room.dart';
import '../../view/screens/feed.dart';
import '../../view/screens/profile.dart';
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
        children: [Feed(), ChatRoom(), Profile()],
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (page) {
          setState(() {
            pageIndex = page;
          });
        },
      ),
      bottomNavigationBar:
          homeController.bottomNavigationBar(pageIndex, homePageController),
    );
  }
}
