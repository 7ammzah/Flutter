import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color lightBeige = Color.fromRGBO(224, 210, 207, 1);
MaterialColor lightBeigeMaterial = const MaterialColor(0xFFE0D2CF, {
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
const Color beige = Color.fromRGBO(198, 175, 141, 1);
MaterialColor beigeMaterialColor = const MaterialColor(
  0xFFC6AF8D,
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
const Color white = Colors.white;
const Color black = Colors.black;
const Color grey = Colors.grey;
const Color orange = Colors.orangeAccent;
const Color darkGrey = Color(0xFF121212);

class Themes {
  static final lightTheme = ThemeData(
      primaryColor: lightBeige,
      backgroundColor: white,
      brightness: Brightness.light);
  static final darkTheme = ThemeData(
      primaryColor: lightBeige,
      backgroundColor: darkGrey,
      brightness: Brightness.dark);

  TextStyle getheadingStyle(Color? clr) {
    return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: clr,
        fontStyle: FontStyle.italic
      ),
    );
  }

  TextStyle gettitleStyle(Color? clr) {
    return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: clr,
      ),
    );
  }

  TextStyle getsubTitleStyle(Color? clr) {
    return GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: 14,
        color: clr,
      ),
    );
  }
}
