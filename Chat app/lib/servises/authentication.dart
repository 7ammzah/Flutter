import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Authentication extends GetxController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late String userUid;
  String get getUserId => userUid;
  Future logIntoAccount(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    User user = userCredential.user!;
    userUid = user.uid;
    print(userUid);
  }

  Future createAccount(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    User user = userCredential.user!;
    userUid = user.uid;
    print('Create an account uid : $userUid');
  }

  Future logOut() {
    return firebaseAuth.signOut();
  }
}
