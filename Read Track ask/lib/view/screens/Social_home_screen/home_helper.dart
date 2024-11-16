import 'dart:io';

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:read_track_ask/constants/theme.dart';
import 'package:read_track_ask/services/firebase_operations.dart';

class HomeHelper with ChangeNotifier {
  File? file;

  Widget bottomNavBar(
      BuildContext context, int index, PageController pageController) {
    // XFile? image =
    //     Provider.of<FireBaseOpreations>(context, listen: false).theFileImage;
    // file = File(image!.path);
    return CustomNavigationBar(
      currentIndex: index,
      bubbleCurve: Curves.bounceIn,
      scaleCurve: Curves.decelerate,
      selectedColor: orange,
      unSelectedColor: grey,
      strokeColor: beige,
      scaleFactor: 0.5,
      iconSize: 30,
      onTap: (val) {
        index = val;
        pageController.jumpToPage(val);
        notifyListeners();
      },
      items: [
        CustomNavigationBarItem(
          icon: const Icon(Icons.home_outlined),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.feed_outlined),
        ),
        CustomNavigationBarItem(
          icon: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                Provider.of<FireBaseOpreations>(context, listen: false)
                    .initUserImage),
          ),
        ),
      ],
    );
  }
}
