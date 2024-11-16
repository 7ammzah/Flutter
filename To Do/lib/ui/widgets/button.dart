import 'package:flutter/material.dart';
import 'package:to_do/ui/theme.dart';

class MyButton extends StatelessWidget {
  MyButton({Key? key, required this.label, required this.onTap})
      : super(key: key);
  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 120,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: purpleClr
        ),
        child: Text(
          label,
          style: Themes().ButtonStyle,
        ),
      ),
    );
  }
}
