import 'package:chat_app/constant/color.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Widget bottomNavigationBar(int index, PageController pageController) {
    return CustomNavigationBar(
      currentIndex: index,
      bubbleCurve: Curves.bounceIn,
      scaleCurve: Curves.decelerate,
      selectedColor: beige,
      unSelectedColor: grey,
      strokeColor: blue,
      scaleFactor: 0.5,
      iconSize: 30,
      onTap: (val) {
        index = val;
        pageController.jumpToPage(val);
      },
      items: [
        CustomNavigationBarItem(icon: const Icon(Icons.home)),
        CustomNavigationBarItem(icon: const Icon(Icons.message_rounded)),
        CustomNavigationBarItem(
          icon: const CircleAvatar(
            radius: 35,
            backgroundColor: beige,
          ),
        ),
      ],
    );
  }
}
