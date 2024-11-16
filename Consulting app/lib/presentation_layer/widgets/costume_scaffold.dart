import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constants/constants.dart';
import '../../constants/navigation_drawer.dart';
import '../../constants/strings.dart';

class CostumeScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final IconData iconData;
  final bool isExpert;
  final bool showOptions;

  const CostumeScaffold({
    Key? key,
    required this.title,
    required this.body,
    required this.iconData,
    required this.isExpert,
    required this.showOptions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(
        isExpert: true,
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: kModerateColor,
        actions: [
          showOptions
              ? PopupMenuButton(
                  color: Colors.indigoAccent,
                  onSelected: (value) {
                    if (value == MenuItem.edit_item) {
                      isExpert
                          ? Navigator.pushNamed(
                              context, AppStrings.editExpertProfile)
                          : Navigator.pushNamed(
                              context, AppStrings.editClientProfile);
                    }
                  },
                  itemBuilder: (context) => [
                        const PopupMenuItem(
                            value: MenuItem.edit_item,
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ))
                      ])
              : Column(),
          !isExpert
              ? IconButton(
                  icon: Icon(Icons.chat_outlined),
                  onPressed: () {
                    Navigator.pushNamed(context, AppStrings.allExperts);
                    print('done');
                  },
                )
              : Row()
        ],
      ),
      body: body,
    );
  }
}

enum MenuItem {
  edit_item;
}
