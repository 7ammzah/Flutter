import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/selected_list_controller.dart';
import '../theme.dart';

class Tag extends StatefulWidget {
  final String text;
  final void Function(String) onSelected;

  Tag({required this.text, required this.onSelected});

  @override
  _TagState createState() => _TagState();
}

class _TagState extends State<Tag> {
  bool _selected = false;
  final tagController = Get.put(SelectedListController(), permanent: true);

  void _toggleSelection() {
    setState(() {
      _selected = !_selected;
      widget.onSelected(widget.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSelection,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: tagController.isContainTag(widget.text)
              ? AppColors.selectedColor
              : white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          widget.text,
          style: const TextStyle(
            color: black,
          ),
        ),
      ),
    );
  }
}
