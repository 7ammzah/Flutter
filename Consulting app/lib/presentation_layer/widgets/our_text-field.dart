import 'package:flutter/material.dart';

class OurTextField extends StatefulWidget {
  final TextInputType? type;
  final String? label;
  final String? hint;
  final IconData? iconData;
  final String? errorText;
  final Function(String?)? onChanged;
  final bool password;
  final TextEditingController controller;

  OurTextField({
    required this.type,
    required this.label,
    required this.iconData,
    required this.hint,
    this.errorText,
    this.onChanged,
    this.password = false,
    required this.controller,
  });

  @override
  State<OurTextField> createState() => _OurTextFieldState();
}

class _OurTextFieldState extends State<OurTextField> {
  bool isPasswordVisible = false;
  bool lang = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.type,
        obscureText: widget.password && !isPasswordVisible,
        decoration: lang
        ? InputDecoration(
          hintStyle: TextStyle(

          ),
          hintText: widget.hint,
          suffixIcon: Icon(widget.iconData , color: Colors.black,),

        )
        : InputDecoration(
          hintText: widget.hint,
          //labelText: widget.label,
          prefixIcon: Icon(widget.iconData , color: Colors.black,),
          suffixIcon: widget.password
              ? GestureDetector(
            onTap: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
              child: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.black,
              ),
          )
              : null,
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}


