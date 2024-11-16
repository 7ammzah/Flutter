import 'package:flutter/material.dart';

import '../theme.dart';

class SelectedTag extends StatefulWidget {
  final String text;

  SelectedTag({required this.text});

  @override
  _SelectedTagState createState() => _SelectedTagState();
}

class _SelectedTagState extends State<SelectedTag> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.selectedColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        widget.text,
        style: const TextStyle(
          color: black,
        ),
      ),
    );
  }
}
