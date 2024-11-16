import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../../../services/authentication_with_social.dart';
import '../../../services/firebase_operations.dart';
import 'login_screen.dart';
import '../../theme.dart';
import '../../widgets/button.dart';
import '../../widgets/input_field.dart';
import '../pick_your_fav_flow/favorite_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreen();
}

bool visibility = false;
bool isPassword = true;

class _SignUpScreen extends State<SignUpScreen> {
  static List<String> topics = [
    'Romance',
    'Sci-fi',
    'Love',
    'Comedy',
    'Mystery',
    'Action',
    'Thriller',
    'Slice of life'
  ];
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController first = TextEditingController();
    TextEditingController last = TextEditingController();

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
                //padding:const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign Up',
                      style: Themes.gettitleStyle(beige),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          'Already have an account?',
                          style: Themes.getsubTitleStyle(black),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          child: Text(
                            'log In',
                            style: Themes.getsubTitleStyle(beige),
                          ),
                          onTap: () {
                            Get.to(() => const LogInScreen());
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: InputField(
                              hint: 'First Name',
                              controller: first,
                              isPassword: false,
                              textInputType: TextInputType.name,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            child: InputField(
                              hint: 'Last Name',
                              controller: last,
                              isPassword: false,
                              textInputType: TextInputType.name,
                            ),
                          ),
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
                      //onTapWidget: dosomething,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    InputField(
                      hint: 'Create Password',
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
                    const SizedBox(
                      height: 8,
                    ),
                    MyButton(
                      label: 'Sign Up',
                      onTap: () async {
                        await Provider.of<AuthenticationWithSocialMediaApp>(
                                context,
                                listen: false)
                            .createSocialMediaAccount(first.text, last.text,
                                email.text, password.text)
                            .whenComplete(() async {
                          await Provider.of<FireBaseOpreations>(context,
                                  listen: false)
                              .addUser(context, first.text, last.text,
                                  email.text, password.text);
                        }).whenComplete(() async {
                          await Provider.of<FireBaseOpreations>(context,
                                  listen: false)
                              .initUserData(context);
                        }).whenComplete(() {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child: const FavoriteScreen(),
                                  type: PageTransitionType.rightToLeft));
                        });
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
