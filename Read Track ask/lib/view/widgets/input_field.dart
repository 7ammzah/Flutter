import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme.dart';
import 'size_config.dart';

class InputField extends StatelessWidget {
  InputField({
    Key? key,
    this.hint,
    this.controller,
    this.widget,
    this.textInputType,
    this.isPassword,
    this.expands = false,
  }) : super(key: key);

  final String? hint;
  final TextEditingController? controller;
  final Widget? widget;
  final TextInputType? textInputType;
  final bool expands;
  bool? isPassword;

  @override
  Widget build(BuildContext context) {
    bool visiblity = false;
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 51,
          width: SizeConfig.screenWidth,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: black),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller,
                  autofocus: false,
                  cursorColor: black,
                  keyboardType:
                      expands ? TextInputType.multiline : textInputType,
                  obscureText: isPassword! && !visiblity,
                  expands: expands,
                  maxLines: expands ? null : 1,
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle:
                        Themes.getsubTitleStyle(grey).copyWith(fontSize: 16),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: context.theme.colorScheme.background,
                          width: 0),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: context.theme.colorScheme.background,
                          width: 0),
                    ),
                  ),
                ),
              ),
              widget ?? Container(),
            ],
          ),
        ),
      ],
    );
  }
}

class DialogInputField extends StatelessWidget {
  const DialogInputField({
    Key? key,
    this.hint,
    this.controller,
    this.widget,
    this.textInputType,
  }) : super(key: key);

  final String? hint;
  final TextEditingController? controller;
  final Widget? widget;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                autofocus: false,
                cursorColor: black,
                keyboardType: textInputType,
                minLines: 1,
                maxLines: 7,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: Themes.getsubTitleStyle(grey),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: context.theme.colorScheme.background, width: 0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            widget ?? Container(),
          ],
        ),
      ],
    );
  }
}
