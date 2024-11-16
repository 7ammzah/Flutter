import 'package:flutter/material.dart';
import 'colors.dart';

class AppButtonStyle {
  static ButtonStyle buttonStyle = ButtonStyle(
    //   fixedSize: MaterialStateProperty.all(const Size(200, 30)),
    elevation: MaterialStateProperty.all(5),
    backgroundColor: MaterialStateProperty.all(AppColor.BlueColor),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  );
}

class AppTextStyle {
  static const nameTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}

