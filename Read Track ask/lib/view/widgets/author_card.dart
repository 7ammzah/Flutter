import 'package:flutter/material.dart';

import '../theme.dart';

class AuthorCard extends StatelessWidget {
  const AuthorCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.selectable,
    this.selected = false,
  });

  final String imagePath;
  final String name;
  final bool selectable;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.selectedColor,
            ),
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: Image(
                image: AssetImage(imagePath),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            color: !selectable
                ? AppColors.selectedColor
                : (selected ? AppColors.selectedColor : Colors.grey[300]),
          ),
          width: double.infinity,
          child: Text(
            name,
            style: Themes.getsubTitleStyle(black),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
