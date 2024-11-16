import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:read_track_ask/services/firebase_operations.dart';
import 'package:read_track_ask/view/screens/Social_home_screen/social_home.dart';

import '../../constants/theme.dart';
import '../widgets/button.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  void initState() {
    Provider.of<FireBaseOpreations>(context, listen: false)
        .initUserData(context);
    super.initState();
  }

  File? file;

  @override
  Widget build(BuildContext context) {
    // XFile? image =
    //     Provider.of<FireBaseOpreations>(context, listen: false).theImageUrl;
    //file = File(image!.path);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Edit Profile',
          style: Themes().gettitleStyle(black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Text(
                  'Please Pick Your Image Profile',
                  style: Themes().gettitleStyle(black),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          Provider.of<FireBaseOpreations>(context,
                                  listen: false)
                              .initUserImage,
                        ),
                        child: Image.network(
                          Provider.of<FireBaseOpreations>(context,
                                  listen: false)
                              .initUserImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 80,
                    child: IconButton(
                      icon: const Icon(
                        Icons.add_a_photo_outlined,
                        color: beige,
                      ),
                      onPressed: () async {
                        return showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 100,
                              // color: orange,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: grey.withOpacity(0.1)),
                                    child: GestureDetector(
                                      onTap: () {
                                        Provider.of<FireBaseOpreations>(context,
                                                listen: false)
                                            .newPick(ImageSource.camera);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Icon(Icons.camera_alt_outlined),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Camera',
                                            style:
                                                Themes().gettitleStyle(black),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: grey.withOpacity(0.1)),
                                    child: GestureDetector(
                                      onTap: () {
                                        Provider.of<FireBaseOpreations>(context,
                                                listen: false)
                                            .newPick(ImageSource.gallery);
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Icon(Icons.image_outlined),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Gallery',
                                            style:
                                                Themes().gettitleStyle(black),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ).whenComplete(() {
                          setState(() {});
                          
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 300,
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: Container(
              //         child: InputField(
              //           hint: 'First Name',
              //           //controller: _first,
              //           isPassword: false,
              //           textInputType: TextInputType.name,
              //         ),
              //       ),
              //     ),
              //     const SizedBox(
              //       width: 10,
              //     ),
              //     Expanded(
              //       child: Container(
              //         child: InputField(
              //           hint: 'Last Name',
              //           //controller: _last,
              //           isPassword: false,
              //           textInputType: TextInputType.name,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // const SizedBox(
              //   height: 8,
              // ),
              // InputField(
              //   hint: 'Email',
              //   //controller: email,
              //   widget: const Icon(Icons.email_outlined),
              //   isPassword: false,
              //   textInputType: TextInputType.emailAddress,
              // ),
              // const SizedBox(
              //   height: 8,
              // ),
              // InputField(
              //   hint: 'Password',
              //   //controller: email,
              //   widget: const Icon(Icons.lock_outline_rounded),
              //   isPassword: false,
              //   textInputType: TextInputType.emailAddress,
              // ),
              // const SizedBox(
              //   height: 20,
              // ),
              MyButton(
                backgroundColor: beige,
                label: 'Finish',
                textColor: black,
                onTap: () async {
                  String imageUrl =
                      Provider.of<FireBaseOpreations>(context, listen: false)
                          .theImageUrl!;
                  await Provider.of<FireBaseOpreations>(context, listen: false)
                      .updateUser(context, imageUrl)
                      .whenComplete(() {
                    print('The Image Url Updated');
                    print('whaaaaaaaaatttt $imageUrl');
                    Get.to(() => const SocialHome());
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       'Joined  22-May 2023',
              //       style: Themes().gettitleStyle(black),
              //     ),
              //     Container(
              //       decoration: BoxDecoration(
              //         color: Colors.redAccent.withOpacity(0.1),
              //         borderRadius: BorderRadius.circular(30),
              //       ),
              //       child: Center(
              //         child: GestureDetector(
              //           onTap: () {
              //             Provider.of<AuthenticationWithSocialMediaApp>(context,
              //                     listen: false)
              //                 .logOut();
              //             Get.offAll(const LogInScreen());
              //           },
              //           child: Text(
              //             'Delete',
              //             style: Themes().gettitleStyle(Colors.redAccent),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Future selectImg() async {
    Get.bottomSheet(
      Container(
        height: 100,
        color: white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.camera_alt_outlined),
                Text('Camera'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.photo_size_select_actual_outlined),
                Text('Gallery'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future selectImage() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Text(
                    'Select Image From !',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          // Provider.of<FireBaseOpreations>(context,
                          //         listen: false)
                          //     .pickUserImage(context, ImageSource.gallery);
                        },
                        child: Card(
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/images/gallery.png',
                                    width: 60,
                                    height: 60,
                                  ),
                                  const Text('Gallery'),
                                ],
                              ),
                            )),
                      ),
                      GestureDetector(
                        onTap: () async {
                          // Provider.of<FireBaseOpreations>(context,
                          //         listen: false)
                          //     .pickUserImage(context, ImageSource.camera);
                        },
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage: FileImage(
                                      Provider.of<FireBaseOpreations>(context,
                                              listen: false)
                                          .getUserImage),
                                ),
                                const Text('Camera'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  selectImageFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  //
  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }
}
