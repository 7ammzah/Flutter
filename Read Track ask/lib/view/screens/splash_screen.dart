import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:read_track_ask/constants/theme.dart';

import 'signing_in_flow/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    delayd();
  }

  delayd() async {
    await Future.delayed(const Duration(seconds: 4));
    Get.to(() =>  const LogInScreen());
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/splash_screen.png'),
            fit: BoxFit.fill),
      ),
      child: Column(
        children: [
          SizedBox(
            height: mediaQuery.size.height / 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Read track ask!',
                style: Themes().getheadingStyle(lightBeige),
              ),
            ],
          )
        ],
      ),
    );
  }
}
