import 'package:flutter/material.dart';

class AppColor {
  static const moderateColor = Color(0xFF1D1F33);
  static const darkColor = Color(0xFF04040C);
  static const lightColor = Color(0xFF6F7693);
  static const lightModerateColor = Color(0xFF4C5065);
  static const tooLightColor = Color(0xFFB7C8EC);
  static const BlueColor = Colors.blueAccent;
  static const tooShiningColor = Color(0xFFFD0225);
  static const shiningColor = Color(0xAAFD0225);
  static const moderateShiningColor = Color(0x77FD0225);
  static const lightShiningColor = Color(0x50FD0225);
  static const shiningElevation = <BoxShadow>[
    BoxShadow(
        offset: Offset(0.0, 3.0),
        blurRadius: 3.0,
        spreadRadius: -2.0,
        color: shiningColor),
    BoxShadow(
      offset: Offset(0.0, 3.0),
      blurRadius: 4.0,
      color: moderateShiningColor,
    ),
    BoxShadow(
      offset: Offset(0.0, 1.0),
      blurRadius: 8.0,
      color: lightShiningColor,
    ),
  ];
}

