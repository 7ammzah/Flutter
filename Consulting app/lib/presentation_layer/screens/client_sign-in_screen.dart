import 'package:flutter/material.dart';
import 'package:new_consulting/constants/strings.dart';
import '../../constants/styles.dart';
import '../../controller/register_controller.dart';
import '../../data_layer/models/register_user.dart';
import '../widgets/background.dart';
import '../widgets/our_text-field.dart';

class ClientSignInScreen extends StatefulWidget {
  static String id = 'user_sign-in_screen';

  const ClientSignInScreen({Key? key}) : super(key: key);

  @override
  State<ClientSignInScreen> createState() => _ClientSignInScreenState();
}

class _ClientSignInScreenState extends State<ClientSignInScreen> {
  TextEditingController first = TextEditingController();
  TextEditingController last = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Background(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 160,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: const Text(
                  "Register",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "SourceSansPro",
                      fontSize: 35,
                      color: Colors.blueAccent),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0XFF8F7FFD),
                        Color(0XFF8FD1FF),
                        Color(0XFF8FD1FF),
                        Color(0XAABFD7FF),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      OurTextField(
                        controller: first,
                        type: TextInputType.text,
                        label: 'First Name',
                        hint: 'First Name',
                        iconData: Icons.person_outline,
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      OurTextField(
                        controller: last,
                        type: TextInputType.text,
                        label: 'Last Name',
                        hint: 'Last Name',
                        iconData: Icons.person_outline,
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      OurTextField(
                        controller: email,
                        type: TextInputType.emailAddress,
                        label: 'Email',
                        hint: 'Email',
                        iconData: Icons.email_outlined,
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      OurTextField(
                        controller: password,
                        type: TextInputType.visiblePassword,
                        label: 'Password',
                        hint: 'Password',
                        iconData: Icons.lock,
                        password: true,
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: ElevatedButton(
                  onPressed: () {
                    //TODO: Heeeeeeeeeeeere
                    final client = UserRegister(
                      firstName: first.text,
                      lastName: last.text,
                      email: email.text,
                      password: password.text,
                    );
                    RegisterController().registerClient(context, client);
                    Navigator.pushNamed(context, AppStrings.clientProfile);
                  },
                  style: AppButtonStyle.buttonStyle,
                  child: SizedBox(
                    height: 20.0,
                    width: size.width * 0.4,
                    child: const Text(
                      'Register',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

