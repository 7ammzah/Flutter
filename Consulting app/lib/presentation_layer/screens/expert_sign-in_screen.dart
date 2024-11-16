import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_consulting/constants/strings.dart';
import '../../business_logic_layer/cubit/consulting_cubit.dart';
import '../../constants/colors.dart';
import '../../data_layer/models/field.dart';
import '../widgets/background.dart';
import '../widgets/our_text-field.dart';

class ExpertSignInScreen extends StatefulWidget {
  const ExpertSignInScreen({Key? key}) : super(key: key);

  @override
  State<ExpertSignInScreen> createState() => _ExpertSignInScreenState();
}

class _ExpertSignInScreenState extends State<ExpertSignInScreen> {
  TextEditingController first = TextEditingController();
  TextEditingController last = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Field field = Field(title: '', id: 0);

  List<Field>? fields = [];

  bool value = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ConsultingCubit>(context).getAllFields();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Background(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 90,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: const Text(
                    "Register",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "SourceSansPro",
                        fontSize: 35,
                        color: Colors.blueAccent
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0XFF8FA8FF),
                        Color(0XFF8FD1FF),
                        Color(0XFF8FD1FF),
                        Color(0XAABFD7FF),
                      ],
                    ),
                  ),
                  child: SingleChildScrollView(
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
                          height: size.height * 0.01,
                        ),
                        OurTextField(
                          controller: last,
                          type: TextInputType.text,
                          label: 'Last Name',
                          hint: 'Last Name',
                          iconData: Icons.person_outline,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        OurTextField(
                          controller: email,
                          type: TextInputType.emailAddress,
                          label: 'Email',
                          hint: 'Email',
                          iconData: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        OurTextField(
                          controller: password,
                          type: TextInputType.visiblePassword,
                          label: 'Password',
                          hint: 'Password',
                          iconData: Icons.lock,
                          password: true,
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppStrings.expert_in);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            'Next Page',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColor.BlueColor,
                            ),
                          ),
                          SizedBox(width: 20,),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    )
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget checkBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Checkbox(
          value: value,
          onChanged: (value) {
            setState(() {
              this.value = value!;
            });
          },
        ),
      ],
    );
  }

  Widget buildSingleCheckBox(String title) => CheckboxListTile(
        value: value,
        title: Text(title),
        onChanged: (value) {
          setState(() {
            this.value = value!;
          });
        },
      );
}
