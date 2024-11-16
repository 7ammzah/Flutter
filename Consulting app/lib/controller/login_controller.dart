import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../constants/strings.dart';
import '../data_layer/models/login_user.dart';

const token = '';

class LoginController {
  Future<dynamic> login(context, LoginUser user, rule) async {
    if (user.email!.isEmpty || user.password!.isEmpty) {
      return Fluttertoast.showToast(
        msg: 'Fields Cannot be blanc!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey,
      );
    }
    print("${user.email} ${user.password}");

    var url = Uri.http("192.168.43.30:80", "api/$rule");
    var response = await http.post(
      url,
      body: user.toJson(user),
    );

    print("${user.email} ${user.password}");

    if (response.statusCode == 200) {
      Navigator.pushNamed(context, AppStrings.allExperts);
      var data = jsonDecode(response.body);
      AppStrings.token = data['access_token'];
      return data;
    }

    return Fluttertoast.showToast(
      msg: "Email and Password combination does not exist",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.transparent,
    );
  }
}
