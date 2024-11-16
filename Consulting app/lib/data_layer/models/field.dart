import 'package:flutter/material.dart';
class Field {
  String? title;
  int? id;
  Widget? children;
  Field({this.title, this.id , this.children});

  Field.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'];
    children = json['expertises'];
  }
}

