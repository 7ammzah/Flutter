import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_consulting/constants/strings.dart';
import '../../constants/styles.dart';
import 'client_profile.dart';
import '../widgets/background.dart';
import '../widgets/our_text-field.dart';

class EditExpertProfile extends StatefulWidget {
  static String id = 'edit_expert_profile_screen';

  const EditExpertProfile({Key? key}) : super(key: key);

  @override
  State<EditExpertProfile> createState() => _EditExpertProfileState();
}

class _EditExpertProfileState extends State<EditExpertProfile> {
  TextEditingController first = TextEditingController();
  TextEditingController last = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController location = TextEditingController();
  String selectedImagePath = '';

  get child => null;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Background(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: imageProfile(),
                ),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.rectangle,
                      gradient: const LinearGradient(
                        colors: [
                          Color(0XFF8FA8FF),
                          Color(0XFF8FD1FF),
                          Color(0XFF8FD1FF),
                          Color(0XAABFD7FF),
                        ],
                      )),
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
                        controller: number,
                        type: TextInputType.number,
                        label: 'Phone Number',
                        hint: 'Phone Number',
                        iconData: Icons.phone,
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      OurTextField(
                        controller: location,
                        type: TextInputType.text,
                        label: 'Location',
                        hint: 'Location',
                        iconData: Icons.edit_location,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppStrings.expertProfile);
                    },
                    style: AppButtonStyle.buttonStyle,
                    child: SizedBox(
                      height: 20.0,
                      width: size.width * 0.4,
                      child: const Text(
                        'Update',
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
      ),
    );
  }

  Widget imageProfile() {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 65,
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 120, vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: selectedImagePath == ''
                    ? Image.asset(
                  "assets/images/user.png",
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                )
                    : Image.file(
                  File(selectedImagePath),
                  width: 140,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
        Positioned(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(230, 123, 10, 10),
              child: IconButton(
                color: Colors.indigo,
                onPressed: () {
                  selectImage();
                },
                icon: const Icon(Icons.add_a_photo),
              ),
            )),
      ],
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
              height: 150,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const Text(
                      'Select Image From !',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            selectedImagePath = await selectImageFromGallery();
                            print('Image_Path:-');
                            print(selectedImagePath);
                            if (selectedImagePath != '') {
                              Navigator.pop(context);
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("No Image Selected !"),
                              ));
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/gallery.png",
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
                            selectedImagePath = await selectImageFromCamera();
                            print('Image_Path:-');
                            print(selectedImagePath);

                            if (selectedImagePath != '') {
                              Navigator.pop(context);
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("No Image Captured !"),
                              ));
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/camera.png",
                                      width: 60,
                                      height: 60,
                                    ),
                                    const Text('Camera'),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
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

