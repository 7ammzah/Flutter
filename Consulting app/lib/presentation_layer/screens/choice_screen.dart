import 'package:flutter/material.dart';
import '../widgets/background.dart';
import 'client_sign-in_screen.dart';
import 'expert_sign-in_screen.dart';

class ChoiceScreen extends StatefulWidget {
  static String id = 'choice_screen';

  //const ChoiceScreen({Key? key}) : super(key: key);

  @override
  State<ChoiceScreen> createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Background(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Text(
                    'Register as',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: "SourceSansPro",
                      color: Colors.indigoAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 12),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExpertSignInScreen(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.brown[200]),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(120),
                          ),
                        ),
                      ),
                      child: Container(
                        height: 40.0,
                        width: size.width * 0.3,
                        child: const Text(
                          'Expert',
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: "SourceSansPro",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: Colors.white38,
                      radius: 90,
                      child: Image.asset(
                        'assets/images/choice.png',
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ClientSignInScreen(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.brown[200]),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80),
                          ),
                        ),
                      ),
                      child: Container(
                        height: 40.0,
                        width: size.width * 0.3,
                        child: const Text(
                          'User',
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: "SourceSansPro",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


