import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationWithSocialMediaApp with ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String? userUid;
  String get getUserUid => userUid!;

  Future logIntoSocialMediaAccount(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;
      userUid = user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('User not found');
      } else if (e.code == 'wrong-password') {
        print('Wrong Password');
      }
    } catch (e) {
      print(e);
    }
    if (userUid == null) {
      print('Sign Up Firstly');
    } else {
      print('Login UserUid is : $userUid');
    }
    notifyListeners();
  }

  Future createSocialMediaAccount(String first_name, String last_name,
      String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      userUid = user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      } else if (e.code == 'email-already-in-use') {}
    } catch (e) {
      print(e);
    }
    print('create account and UserUid is : $userUid');
    notifyListeners();
  }

  Future logOut() {
    return firebaseAuth.signOut();
  }

  // String? userid = 'userUid';
  // var users = FirebaseFirestore.instance.collection('users').doc('');

  // Future<void> addUser(
  //     String first, String last, String email, String password) {
  //   // Call the user's CollectionReference to add a new user
  //   return users
  //       .set({
  //         'first_name': first, // John Doe
  //         'last_name': last,
  //         'email': email, // Stokes and Sons
  //         'password': password // 42
  //       })
  //       .then((value) => print("User Added"))
  //       .catchError((error) => print("Failed to add user: $error"));
  // }
}
