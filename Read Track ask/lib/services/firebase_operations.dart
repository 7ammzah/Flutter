import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:read_track_ask/services/authentication_with_social.dart';

class FireBaseOpreations with ChangeNotifier {
  var initUserFirstName;
  var initUserLastName;
  var initUserEmail;
  var initUserPassword;
  var initUserImage =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSoWf7yed8jTZyq8_kked3jE8j5AbYf-0F4g&usqp=CAU';

  get getInitFirstName => initUserFirstName;
  get getInitLastName => initUserLastName;
  get getInitUserEmail => initUserEmail;
  get getInitUserPassword => initUserPassword;
  get getInitUserImage => initUserImage;

  String? theImageUrl;
  String? theProfileImage;
  XFile? theFileImage;
  File? userImage;
  File get getUserImage => userImage!;
  String getUserProfileImage(BuildContext context, String? id) {
    if (id == null) {
      return '';
    } else {
      FirebaseFirestore.instance.collection('users').doc(id).get().then(
        (doc) {
          theProfileImage = doc.data()!['image'];
          print('the profile image is $theProfileImage');
        },
      );
    }
    return theProfileImage ?? 'null';
  }

  newPick(ImageSource source) async {
    String uniqueFileName = DateTime.now().toString();
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file == null) {
      return;
    } else {
      theFileImage = XFile(file.path);
      Reference reference = FirebaseStorage.instance.ref();
      Reference referenceDirImage = reference.child('userProfileImage');
      Reference referenceImageUploaded =
          referenceDirImage.child(uniqueFileName);
      try {
        await referenceImageUploaded.putFile(File(file.path));
        theImageUrl = await referenceImageUploaded.getDownloadURL();
        initUserImage = theImageUrl!;
      } catch (e) {
        print(e);
      }
    }
    print('file path is : ${file.path}');
    print('file url is ${initUserImage}');
  }

  Future initUserData(BuildContext context) async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(Provider.of<AuthenticationWithSocialMediaApp>(context,
                listen: false)
            .userUid)
        .get()
        .then((doc) {
      print('Fetching user data ....');
      initUserFirstName = doc.data()!['first_name'];
      initUserLastName = doc.data()!['last_name'];
      initUserEmail = doc.data()!['email'];
      initUserPassword = doc.data()!['password'];
      initUserImage = doc.data()!['image'];
      print(initUserFirstName);
      print(initUserLastName);
      print(initUserEmail);
      print(initUserPassword);
      print(initUserImage);
      notifyListeners();
    });
  }

  Future<void> addUser(BuildContext context, String first, String last,
      String email, String password) {
    var users = FirebaseFirestore.instance.collection('users').doc(
        Provider.of<AuthenticationWithSocialMediaApp>(context, listen: false)
            .getUserUid);
    // Call the user's CollectionReference to add a new user
    return users
        .set({
          'first_name': first,
          'last_name': last,
          'email': email,
          'password': password,
          'image':
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSoWf7yed8jTZyq8_kked3jE8j5AbYf-0F4g&usqp=CAU'
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<void> updateUser(BuildContext context, String imageUrl) {
    var userUpdated = FirebaseFirestore.instance.collection('users').doc(
        Provider.of<AuthenticationWithSocialMediaApp>(context, listen: false)
            .getUserUid);
    return userUpdated.update(
      {
        'image': imageUrl,
      },
    );
  }

  Future<void> uploadPost(String PostId, dynamic data) async {
    return FirebaseFirestore.instance.collection('posts').doc(PostId).set(data);
  }

  Future followUser(
      String followingUid,
      String followingDocID,
      dynamic followingData,
      String followerUid,
      String followerDocID,
      dynamic followerData) async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(followingUid)
        .collection('follower')
        .doc(followingDocID)
        .set(followingData)
        .whenComplete(
      () async {
        return FirebaseFirestore.instance
            .collection('users')
            .doc(followerUid)
            .collection('following')
            .doc(followerDocID)
            .set(followerData);
      },
    );
  }
}
