import 'package:flutter/material.dart';

import '../theme.dart';
import 'custom_clipper.dart';
import 'custom_dialog.dart';

class NoteCard extends StatelessWidget {
  final int pageNumber;
  String? text;

  NoteCard({
    super.key,
    required this.pageNumber,
    this.text,
  }) {
    text = text ?? 'Note $pageNumber';
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: GestureDetector(
          onLongPress: () {
            showDialog(
                context: context,
                builder: (_) {
                  return EditDialog(
                    text: text,
                    size: size,
                    pageNumber: pageNumber,
                    userEdit: UserEdit.note,
                  );
                });
          },
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: size.width * 0.05),
                    decoration: BoxDecoration(
                      color: AppColors.selectedColor,
                      borderRadius: BorderRadius.circular(8).copyWith(
                        bottomLeft: const Radius.circular(0),
                      ),
                      boxShadow: greyShadow,
                    ),
                    padding: const EdgeInsets.all(20),
                    width: size.width * 0.85,
                    child: Text(
                      text!,
                      softWrap: true,
                      style: Themes.getsubTitleStyle(black),
                    ),
                  ),
                  ClipShadowPath(
                    shadow: greyShadow.first,
                    clipper: CustomTriangleClipper(),
                    child: Container(
                      width: 15,
                      height: 10,
                      color: AppColors.selectedColor,
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                radius: pageNumber >= 10000 ? 25 : 20,
                backgroundColor: Colors.orangeAccent.withAlpha(180),
                child: Text(
                  pageNumber.toString(),
                  style: Themes.getsubTitleStyle(black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
