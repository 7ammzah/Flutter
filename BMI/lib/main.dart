import 'package:bmi/resault_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Color.fromARGB(221, 28, 18, 26),
        textTheme: const TextTheme(
          displayLarge:  TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
          displayMedium: TextStyle(
                  fontSize: 35,
                  //fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
        ),
        
      ),
      home: const MyHomePage(),
      //const Resault(resault: 20.0, isMale: true , age: 22),
    );
  }
}

