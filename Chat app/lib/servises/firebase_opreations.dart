import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../controllers/landing_utils.dart';

class FireBaseOpreations extends GetxController {
  final landingController = Get.put(LandingUtils() , permanent: false);
  late UploadTask imageUploadTask;

  Future uploadUserImage(BuildContext context) async {
    Reference imageReference = FirebaseStorage.instance.ref().child(
        'userProfileImage/${landingController.getUserImage.path}/${TimeOfDay.now()}');
    imageUploadTask = imageReference.putFile(landingController.getUserImage);
    await imageUploadTask.whenComplete(() {
      print('Image Uploaded');
    });
    imageReference.getDownloadURL().then((url) {
      landingController.userImageUrl = url.toString();
      print('User Profile Url : ${landingController.userImageUrl}');
    });
  }
}
