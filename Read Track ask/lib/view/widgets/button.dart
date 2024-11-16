import 'package:flutter/material.dart';

import '../theme.dart';

class MyButton extends StatelessWidget {
  MyButton({
    Key? key,
    this.label,
    this.onTap,
    this.backgroundColor,
    this.textColor,
    this.borderradius,
  }) : super(key: key);

  final String? label;
  final Function()? onTap;
  Color? backgroundColor;
  Color? textColor;
  double? borderradius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
          style: Themes.gettitleStyle(textColor),
        ),
      ),
    );
  }
}

class DialogButton extends StatelessWidget {
  DialogButton({
    Key? key,
    this.label,
    this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.borderradius,
  }) : super(key: key);

  final String? label;
  final Function()? onTap;
  Color? backgroundColor;
  Color? borderColor;

  Color? textColor;
  double? borderradius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(borderColor!.withAlpha(20)),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          side: MaterialStateProperty.all(BorderSide(
            color: borderColor!,
          )),
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
          style: Themes.gettitleStyle(textColor),
        ),
      ),
    );
  }
}
