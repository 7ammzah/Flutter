import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../../services/authentication_with_social.dart';
import '../../../services/firebase_operations.dart';
import '../../theme.dart';
import '../../widgets/button.dart';
import '../../widgets/input_field.dart';
import '../Social_home_screen/social_home.dart';
import 'signup_screen.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

bool visibility = false;
bool isPassword = true;

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(
                height: mediaQuery.size.height / 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Read track ask',
                    style: Themes.getheadingStyle(beige),
                  ),
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Find more books you \'ll read,',
                      style: Themes.getsubTitleStyle(black),
                    ),
                    Text(
                      'Create virtual shelves to orgnize your books',
                      style: Themes.getsubTitleStyle(black),
                    ),
                    Text(
                      'and get recommendations from readers like you',
                      style: Themes.getsubTitleStyle(black),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Log In',
                      style: Themes.gettitleStyle(beige),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: Themes.getsubTitleStyle(black),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          child: Text(
                            'Sign Up',
                            style: Themes.getsubTitleStyle(beige),
                          ),
                          onTap: () {
                            Get.to(() => const SignUpScreen());
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    InputField(
                      hint: 'Email',
                      controller: email,
                      widget: const Icon(Icons.email_outlined),
                      isPassword: false,
                      textInputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    InputField(
                      hint: 'Password',
                      controller: password,
                      widget: GestureDetector(
                        onTap: onTapPasswordWidget,
                        child: Icon(
                          visibility == true
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                      isPassword: isPassword,
                      textInputType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'forgot Password?',
                      style: Themes.getsubTitleStyle(beige),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    MyButton(
                      label: 'Log In',
                      onTap: () async {
                        await Provider.of<AuthenticationWithSocialMediaApp>(
                                context,
                                listen: false)
                            .logIntoSocialMediaAccount(
                                email.text, password.text)
                            .whenComplete(() async {
                          await Provider.of<FireBaseOpreations>(context,
                                  listen: false)
                              .initUserData(context);
                        }).whenComplete(
                          () {
                            Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child: const SocialHome(),
                                  type: PageTransitionType.rightToLeft),
                            );
                          },
                        );
                      },
                      textColor: white,
                      backgroundColor: beige,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          'By using read track ask, you agree our ',
                          style: Themes.getsubTitleStyle(black),
                        ),
                        GestureDetector(
                          child: Text(
                            'Terms',
                            style: Themes.getsubTitleStyle(beige),
                          ),
                        ),
                        Text(
                          ' , ',
                          style: Themes.getsubTitleStyle(black),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          child: Text(
                            'Privacy Policy',
                            style: Themes.getsubTitleStyle(beige),
                          ),
                        ),
                        Text(
                          ' and ',
                          style: Themes.getsubTitleStyle(black),
                        ),
                        GestureDetector(
                          child: Text(
                            'Ads Policy ',
                            style: Themes.getsubTitleStyle(beige),
                          ),
                        ),
                        Text(
                          '.',
                          style: Themes.getsubTitleStyle(black),
                        )
                      ],
                    ),
                    const Image(
                      image: AssetImage('assets/images/book.jpg'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onTapPasswordWidget() {
    setState(() {
      visibility = !visibility;
      isPassword = !isPassword;
    });
  }
}
