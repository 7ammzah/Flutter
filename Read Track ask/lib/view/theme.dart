import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color lightbeige = Color.fromRGBO(224, 210, 207, 1);
MaterialColor lightbeigeMaterial = const MaterialColor(0xFFE0D2CF, {
  50: Color(0xFFFFF7F6),
  100: Color(0xFFFFEFEA),
  200: Color(0xFFFFE5DE),
  300: Color(0xFFFFDBD2),
  400: Color(0xFFFFD3C9),
  500: Color(0xFFE0D2CF),
  600: Color(0xFFCFC0BE),
  700: Color(0xFFBEB0AE),
  800: Color(0xFFADA09E),
  900: Color(0xFF9C8F8E),
});
const Color beige = Color(0xFFD1A35D);
MaterialColor beigeMaterialColor = const MaterialColor(
  0xFFD1A35D,
  <int, Color>{
    50: Color.fromRGBO(198, 175, 141, 0.1),
    100: Color.fromRGBO(198, 175, 141, 0.2),
    200: Color.fromRGBO(198, 175, 141, 0.3),
    300: Color.fromRGBO(198, 175, 141, 0.4),
    400: Color.fromRGBO(198, 175, 141, 0.5),
    500: Color.fromRGBO(198, 175, 141, 0.6),
    600: Color.fromRGBO(198, 175, 141, 0.7),
    700: Color.fromRGBO(198, 175, 141, 0.8),
    800: Color.fromRGBO(198, 175, 141, 0.9),
    900: Color.fromRGBO(198, 175, 141, 1),
  },
);

class AppColors {
  static const primaryColor = Color(0xFFD1A35D);
  static const secondaryColor = Color(0xFFEEEEEE);
  static const thirdColor = Color(0xFFEB6717);

  static const selectedColor = Color(0xFFFFE3BC);
}

const Color white = Colors.white;
const Color black = Colors.black;
const Color grey = Colors.grey;
const Color darkGrey = Color(0xFF121212);

List<BoxShadow> greyShadow = [
  BoxShadow(
    color: grey.withOpacity(0.5),
    offset: const Offset(0, 3),
    blurRadius: 3,
  )
];

class Themes {
  static final lightTheme = ThemeData(
      primaryColor: lightbeige,
      backgroundColor: white,
      brightness: Brightness.light);
  static final darkTheme = ThemeData(
      primaryColor: lightbeige,
      backgroundColor: darkGrey,
      brightness: Brightness.dark);

  static getheadingStyle(Color? clr) {
    return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: clr,
      ),
    );
  }

  static TextStyle gettitleStyle(Color? clr) {
    return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: clr,
      ),
    );
  }

  static TextStyle getsubTitleStyle(Color? clr) {
    return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 14,
        color: clr,
      ),
    );
  }
}
