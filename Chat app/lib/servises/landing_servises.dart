import 'package:chat_app/constant/color.dart';
import 'package:chat_app/controllers/landing_utils.dart';
import 'package:image_picker/image_picker.dart';
import '../../view/screens/home.dart';
import 'package:chat_app/servises/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_opreations.dart';

class LandingServises extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController user = TextEditingController();

  final authController = Get.put(Authentication());
  final landingController = Get.put(LandingUtils());
  final firebaseOperation = Get.put(FireBaseOpreations());

  showUserImage(BuildContext context) {
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
          CircleAvatar(
            radius: 80,
            backgroundColor: lightBeige,
            backgroundImage: FileImage(landingController.userImage),
          ),
          Container(
            child: Row(
              children: [
                MaterialButton(
                  child: Text('Reselect'),
                  onPressed: () {
                    landingController.pickUserImage(
                        context, ImageSource.gallery);
                  },
                ),
                MaterialButton(
                  child: Text('Confirm Image'),
                  onPressed: () {
                    firebaseOperation.uploadUserImage(context);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget PasswordLessSignIn(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.40,
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('allUsers').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView(
                  children: snapshot.data!.docs
                      .map((DocumentSnapshot documentSnapshot) {
                return ListTile(
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.recycling_outlined)),
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(documentSnapshot['userimage']),
                  ),
                  subtitle: Text(
                    documentSnapshot['useremail'],
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
                  ),
                  title: Text(
                    documentSnapshot['useremail'],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 12.0),
                  ),
                );
              }).toList());
            }
          }),
    );
  }

  LogInSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: email,
                      decoration: const InputDecoration(
                        hintText: 'Enter email ...',
                        hintStyle: TextStyle(
                            color: white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      style: const TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: password,
                      decoration: const InputDecoration(
                        hintText: 'Enter password ...',
                        hintStyle: TextStyle(
                            color: white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      style: const TextStyle(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      if (email.text.isNotEmpty) {
                        authController
                            .logIntoAccount(email.text, password.text)
                            .whenComplete(() {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: ((context) {
                            return const HomePage();
                          })));
                        });
                      } else {
                        warninText(context, 'fill all data!');
                      }
                    },
                    backgroundColor: Colors.redAccent,
                    child: const Icon(Icons.check),
                  )
                ],
              ),
            ),
          );
        });
  }

  SignInSheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100),
                    child: Divider(
                      thickness: 10.0,
                    ),
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    radius: 80.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: user,
                      decoration: const InputDecoration(
                        hintText: 'Enter name ...',
                        hintStyle: TextStyle(
                            color: black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      style: const TextStyle(
                          color: black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: email,
                      decoration: const InputDecoration(
                        hintText: 'Enter email ...',
                        hintStyle: TextStyle(
                            color: black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      style: const TextStyle(
                          color: black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: password,
                      decoration: const InputDecoration(
                        hintText: 'Enter password ...',
                        hintStyle: TextStyle(
                            color: black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      style: const TextStyle(
                          color: black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      if (email.text.isNotEmpty) {
                        authController
                            .createAccount(email.text, password.text)
                            .whenComplete(() {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: ((context) {
                            return const HomePage();
                          })));
                        });
                      } else {
                        warninText(context, 'fill all data!');
                      }
                    },
                    backgroundColor: Colors.redAccent,
                    child: const Icon(Icons.check),
                  )
                ],
              ),
            ),
          );
        });
  }

  warninText(BuildContext context, String warnin) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              color: black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15),
            ),
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.height,
            child: Center(
              child: Text(
                warnin,
                style: const TextStyle(
                    color: white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          );
        });
  }
}
