import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../constants/styles.dart';
import '../widgets/background.dart';
import '../widgets/our_text-field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool lang = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Background(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 65,
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        lang ? 'تسجيل الدخول' : 'Login',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: "SourceSansPro",
                          fontSize: 35,
                          color: AppColor.BlueColor,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.12,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.rectangle,
                      gradient: const LinearGradient(
                        colors: [
                          Color(0XFF8F7FFD),
                          Color(0XFF8FD1FF),
                          Color(0XFF8FD1FF),
                          Color(0XAABFD7FF),
                        ],
                      )),
                  //color: AppColor.tooLightColor,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Image.asset(
                          'assets/images/login2.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      OurTextField(
                        controller: email,
                        type: TextInputType.emailAddress,
                        label: "Email",
                        hint: "Email",
                        iconData: Icons.email_outlined,
                        errorText: 'Please enter your email',
                        //onChanged: ,
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      OurTextField(
                        controller: password,
                        type: TextInputType.visiblePassword,
                        label: 'Password',
                        hint: 'Password',
                        iconData: Icons.vpn_key,
                        password: true,
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppStrings.allExperts);
                    // final user = LoginUser(
                    //   email: email.text,
                    //   password: password.text,
                    // );
                    //
                    // LoginController().login(context, user, 'userLogin');
                  },
                  style: AppButtonStyle.buttonStyle.copyWith(
                      fixedSize:
                          MaterialStateProperty.all(Size(size.width / 3, 20))),
                  child: const Text(
                    'Login',
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'new to Consult.Hand?',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                        fontFamily: "SourceSansPro",
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        selectType();
                      },
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColor.BlueColor,
                          // decoration: isTapped
                          //     ? TextDecoration.underline
                          //     : TextDecoration.none,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future selectType() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0XFF8FA8FF),
                      Color(0XFF8FD1FF),
                      Color(0XFF8FD1FF),
                      Color(0XAABFD7FF),
                      Color(0XAABFD7AF),
                    ],
                  )),
              height: 180,
              width: 360,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const Text(
                      'Register as!',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Pacifico"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppStrings.clientSignIn);
                            //setState(() {});
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/client.png",
                                      width: 60,
                                      height: 60,
                                    ),
                                    const Text(
                                      'Client',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AppStrings.expertSignIn);
                            //setState(() {});
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/expert.png",
                                      width: 60,
                                      height: 60,
                                    ),
                                    const Text(
                                      'Expert',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
