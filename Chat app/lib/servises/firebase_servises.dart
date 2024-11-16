import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

Future uploadUserAvater(BuildContext context)async{
  Reference imageReference = FirebaseStorage.instance.ref().child('path');
} 
Future initUserData(BuildContext context) async{
  //return FirebaseFirestore();
}