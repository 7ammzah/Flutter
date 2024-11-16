import 'dart:io';

import 'package:chat_app/servises/firebase_opreations.dart';
import 'package:chat_app/servises/landing_servises.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../constant/color.dart';

class LandingUtils extends GetxController {
  //final firebaseOperation = Get.put(FireBaseOpreations());
  final landingController = Get.put(LandingServises());
  final picker = ImagePicker();
  late File userImage;
  File get getUserImage => userImage;
  late String userImageUrl;
  String get getUserImageUrl => userImageUrl;

  Future pickUserImage(BuildContext context, ImageSource source) async {
    final pickedUserImage = await picker.pickImage(source: source);
    pickedUserImage == null
        ? print('select image')
        : userImage = File(pickedUserImage.path);
    print(userImage.path);
    userImage != null
        ? landingController.showUserImage(context)
        : print('Image error');
  }

  Future selectImageOptionsSheet(BuildContext context) async {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      color: Colors.greenAccent,
                      onPressed: () {
                        pickUserImage(context, ImageSource.gallery)
                            .whenComplete(() {
                          Navigator.pop(context);
                          landingController.showUserImage(context);
                        });
                      },
                      child: const Text('From gallery'),
                    ),
                    MaterialButton(
                      color: blue,
                      onPressed: () {
                        pickUserImage(context, ImageSource.camera)
                            .whenComplete(() {
                          Navigator.pop(context);
                          landingController.showUserImage(context);
                        });
                      },
                      child: const Text('From Camera'),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
