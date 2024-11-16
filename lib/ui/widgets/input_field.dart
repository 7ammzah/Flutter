import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/ui/theme.dart';

import '../size_config.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      required this.title,
      required this.hint,
      this.controller,
      this.widget})
      : super(key: key);
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Themes().titleStyle,
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 51,
            width: SizeConfig.screenWidth,
            padding: const EdgeInsets.only(left: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey)),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    style: Themes().subTitleStyle,
                    autofocus: false,
                    cursorColor: Get.isDarkMode?Colors.grey[100] : Colors.grey[600],
                    readOnly: widget == null ? false : true,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: Themes().subTitleStyle,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: context.theme.backgroundColor,
                          width: 0
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: context.theme.backgroundColor,
                          width: 0
                        ),
                      ),
                    ),
                  ),
                ),
                widget ?? Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
