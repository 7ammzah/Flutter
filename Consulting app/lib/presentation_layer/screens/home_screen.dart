import 'package:flutter/material.dart';
import 'package:new_consulting/constants/colors.dart';
import '../../constants/styles.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.moderateColor,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                // App Name
                "Consult.Hand",
                style: TextStyle(
                  color: AppColor.moderateColor,
                  fontSize: 40.0,
                  letterSpacing: 2.5,
                  fontFamily: "Pacifico",
                ),
              ),
              // Home Image
              Flexible(
                child: Image.asset(
                  "assets/images/home_image.png",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    // App Quote
                    "In search of the right",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      fontFamily: "SourceSansPro",
                    ),
                  ),
                  Text(
                    // App Quote
                    " Hand",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.tooShiningColor,
                      fontSize: 27,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      fontFamily: "SourceSansPro",
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  //go to Login Screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                style: AppButtonStyle.buttonStyle.copyWith(
                  fixedSize:
                  MaterialStateProperty.all(Size(size.width / 2, 20)),
                ),
                child: const Text("Let's Talk"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


