import 'package:get/get.dart';

import '../view/screens/landing.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/',
      // getPages: [
      //   GetPage(name: '/', page: () => const Landing()),
      //   // GetPage(name: 'l', page: () => LandingServises()),
      //   // GetPage(name: 'la', page: () => LandingUtils()),
      // ],
      debugShowCheckedModeBanner: false,
      title: 'chating',
      theme: ThemeData(),
      home: const Landing(),
    );
  }
}
