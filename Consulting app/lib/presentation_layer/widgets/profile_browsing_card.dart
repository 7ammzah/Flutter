import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class ProfileBrowsingCard extends StatelessWidget {
  final String? imgPath;
  final String? name;
  final String? category;

  ProfileBrowsingCard({
    required this.imgPath,
    required this.name,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width / 3,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.lightModerateColor,
        ),
        child: Stack(
          children: <Widget>[
            Center(
              child: SizedBox(
                child: Image.asset(imgPath!),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5.0),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.black.withAlpha(0),
                    Colors.black12,
                    Colors.black45
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    name!,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    category!,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


