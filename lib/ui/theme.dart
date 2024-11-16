import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color purpleClr = Colors.deepPurpleAccent;
const Color yellowClr = Colors.yellowAccent;
const Color pinkClr = Colors.pinkAccent;
const Color white = Colors.white;
const primaryClr = purpleClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);

class Themes {
  static final lightTheme = ThemeData(
      primaryColor: purpleClr,
      backgroundColor: white,
      brightness: Brightness.light);
  static final darkTheme = ThemeData(
      primaryColor: purpleClr,
      backgroundColor: darkGreyClr,
      brightness: Brightness.dark);

  TextStyle get headingStyle {
    return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Get.isDarkMode ? white : darkGreyClr,
      ),
    );
  }

  TextStyle get subHeadingStyle {
    return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Get.isDarkMode ? white : darkGreyClr,
      ),
    );
  }

  TextStyle get titleStyle {
    return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Get.isDarkMode ? white : darkGreyClr,
      ),
    );
  }

  TextStyle get subTitleStyle {
    return GoogleFonts.lato(
      textStyle: const TextStyle(
        fontSize: 15,
        //fontWeight: FontWeight.w400,
        color: Colors.grey,
      ),
    );
  }

  TextStyle get bodyStyle {
    return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: Get.isDarkMode ? white : darkGreyClr,
      ),
    );
  }
  TextStyle get ButtonStyle {
    return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Get.isDarkMode ? white : darkGreyClr,
      ),
    );
  }
}
