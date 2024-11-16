import 'package:flutter/material.dart';

const kModerateColor = Colors.indigoAccent;
const kDarkColor = Color(0xFF04040C);
const kLightColor = Color(0xFF6F7693);
const kLightModerateColor = Color(0xFF4C5065);
const kTooLightColor = Color(0xFFBABFD3);
const kTooShiningColor = Color(0xFFFD0225);
const kShiningColor = Color(0xAAFD0225);
const kModerateShiningColor = Color(0x77FD0225);
const kLightShiningColor = Color(0x50FD0225);

const kNameTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

const kShiningElevation = <BoxShadow>[
  BoxShadow(
      offset: Offset(0.0, 3.0),
      blurRadius: 3.0,
      spreadRadius: -2.0,
      color: kShiningColor),
  BoxShadow(
    offset: Offset(0.0, 3.0),
    blurRadius: 4.0,
    color: kModerateShiningColor,
  ),
  BoxShadow(
    offset: Offset(0.0, 1.0),
    blurRadius: 8.0,
    color: kLightShiningColor,
  ),
];

