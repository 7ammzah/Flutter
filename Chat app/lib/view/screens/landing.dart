import 'package:chat_app/constant/color.dart';
import 'package:chat_app/controllers/landing_utils.dart';
import 'package:chat_app/servises/landing_servises.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  final LandingServises landingServises =
      Get.put(LandingServises(), permanent: false);
  final LandingUtils landingUtils = Get.put(LandingUtils(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [white, lightBeige, lightBeige, lightBeige, white]),
        ),
        child: Center(
          child: IconButton(
            onPressed: () {
              emialAuthSheet(context);
            },
            icon: const Icon(
              Icons.email_outlined,
              color: blue,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }

  Future emialAuthSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: grey.withOpacity(0.5),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 100),
                child: Divider(
                  thickness: 10.0,
                ),
              ),
              landingServises.PasswordLessSignIn(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    color: Colors.greenAccent,
                    onPressed: () {
                      landingServises.LogInSheet(context);
                    },
                    child: const Text('LogIn'),
                  ),
                  MaterialButton(
                    color: blue,
                    onPressed: () {
                      landingUtils.selectImageOptionsSheet(context);
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
