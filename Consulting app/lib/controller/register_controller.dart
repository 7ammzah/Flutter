import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../constants/strings.dart';
import '../data_layer/models/register_user.dart';

class RegisterController {
  Future<dynamic> registerClient(context, UserRegister user) async {
    if (user.email!.isEmpty ||
        user.password!.isEmpty ||
        user.firstName!.isEmpty ||
        user.lastName!.isEmpty) {
      return showToast('Fields Cannot be blanc!');
    }

    var url = Uri.http("192.168.43.30:80", "api/userRegister");
    var response = await http.post(
      url,
      body: user.toJson(user),
    );

    print(response.body);

    if (response.statusCode == 200) {
      Navigator.pushNamed(context, AppStrings.clientProfile);
      return jsonDecode(response.body);
    }

    return showToast('Sorry Email is already taken');
  }

  Future<dynamic> registerExpert(context, ExpertRegister user) async {
    if (user.email!.isEmpty ||
        user.password!.isEmpty ||
        user.firstName!.isEmpty ||
        user.lastName!.isEmpty ||
        user.fieldId!.isEmpty) {
      return showToast('Fields Cannot be blanc!');
    }

    var url = Uri.https("192.168.43.30:80", "auth/expertRegister");
    var response = await http.post(
      url,
      body: user.toJson(user),
    );

    print(response.body);

    if (response.statusCode == 200) {
      Navigator.pushNamed(context, AppStrings.editExpertProfile);
      return jsonDecode(response.body);
    }

    return showToast('Sorry Email is already taken');
  }
}

Future<bool?> showToast(msg) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.grey,
  );
}
