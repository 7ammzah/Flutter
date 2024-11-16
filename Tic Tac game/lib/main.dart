import 'package:flutter/material.dart';
import 'package:tic_tac_game/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primarySwatch: Colors.purple,
      ),
      home: const HomeScreen(),
    );
  }
}
