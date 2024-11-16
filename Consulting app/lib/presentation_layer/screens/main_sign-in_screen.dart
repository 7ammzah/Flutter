import 'package:flutter/material.dart';
import 'client_sign-in_screen.dart';
import 'expert_sign-in_screen.dart';

class MainSignInScreen extends StatefulWidget {
  static String id = "main_sign-in_screen";

  @override
  State<MainSignInScreen> createState() => _MainSignInScreenState();
}

class _MainSignInScreenState extends State<MainSignInScreen> {
  int clientFlex = 1;
  int expertFlex = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: expertFlex,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  expertFlex = 8;
                  clientFlex = 1;
                });
              },
              child: Container(
                color: Colors.white,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: ExpertSignInScreen(),
                ),
              ),
            ),
          ),
          Expanded(
            flex: clientFlex,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  clientFlex = 8;
                  expertFlex = 1;
                });
              },
              child: ClientSignInScreen(),
            ),
          ),
        ],
      ),
    );
  }
}


