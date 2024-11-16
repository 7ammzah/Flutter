import 'package:flutter/material.dart';

class Experts {
  int? charId;
  late String? name;
  String? birthday;
  List<dynamic>? occupation;
  late var img;
  String? status;
  List<dynamic>? appearance;
  String? nickname;
  String? portrayed;
  List<dynamic>? betterCallSaulAppearance;

  Experts(
      {this.charId,
      this.name,
      this.birthday,
      this.occupation,
      this.img,
      this.status,
      this.appearance,
      this.nickname,
      this.portrayed,
      this.betterCallSaulAppearance});

  Experts.fromJson(Map<String, dynamic> json) {
    charId = json['char_id'];
    name = json['name'];
    birthday = json['birthday'];
    occupation = json['occupation'].cast<dynamic>();
    img = json['img'];
    status = json['status'];
    appearance = json['appearance'].cast<dynamic>();
    nickname = json['nickname'];
    portrayed = json['portrayed'];
    betterCallSaulAppearance =
        json['better_call_saul_appearance'].cast<dynamic>();
  }
}


/*

class Experts {
  int? charId;
  String? firstName;
  String? lastName;
  String? img;
  String? experience;
  int? phoneNumber;
  String? address;

  Experts(
      {this.charId,
      this.firstName,
      this.lastName,
      this.img,
      this.experience,
      this.phoneNumber,
      this.address});

  Experts.fromJson(Map<String, dynamic> json) {
    charId = json['char_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    img = json['img'];
    experience = json['experience'];
    phoneNumber = json['phone_number'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['char_id'] = charId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['img'] = img;
    data['experience'] = experience;
    data['phone_number'] = phoneNumber;
    data['address'] = address;
    return data;
  }
}
*/