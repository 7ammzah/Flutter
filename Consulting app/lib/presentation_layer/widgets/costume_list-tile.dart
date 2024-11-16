import 'package:flutter/material.dart';

class CostumeListTile extends StatelessWidget {
  final Color? color;
  final IconData? iconData;
  final String? title;

  const CostumeListTile({
    super.key,
    this.color,
    this.iconData,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      iconColor: color,
      textColor: color,
      leading: Icon(iconData),
      title: Text(title!),
    );
  }
}

