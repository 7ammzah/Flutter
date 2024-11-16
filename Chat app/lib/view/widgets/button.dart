import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton(
      {Key? key,
      this.label,
      this.onTap,
      this.backgroundColor,
      this.textColor,
      this.borderradius,
      this.width})
      : super(key: key);
  final String? label;
  final Function()? onTap;
  Color? backgroundColor;
  Color? textColor;
  double? borderradius;
  double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(5),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  borderradius == null ? 30 : borderradius!),
            ),
          ),
        ),
        onPressed: onTap,
        child: Text(
          label!,
          style: TextStyle(color: textColor, fontSize: 20),
        ),
      ),
    );
  }
}
