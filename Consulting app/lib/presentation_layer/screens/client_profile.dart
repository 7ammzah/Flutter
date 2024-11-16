import 'package:flutter/material.dart';
import 'package:new_consulting/constants/strings.dart';
import '../../constants/colors.dart';
import '../../constants/navigation_drawer.dart';
import '../widgets/contact-info_card.dart';
import '../widgets/image_name_category_card.dart';

class ClientProfile extends StatelessWidget {
  final balance = 10.0;

  const ClientProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(
        isExpert: false,
      ),
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: AppColor.moderateColor,
        actions: [
          PopupMenuButton(
            color: Colors.indigoAccent,
            onSelected: (value) {
              if (value == MenuItem.edit_item) {
                Navigator.pushNamed(context, AppStrings.editClientProfile);
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: MenuItem.edit_item,
                child: Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          //TODO: make [image,name,category] together
          ImageNameCategoryHeader(
            isUserProfile: true,
            isExpert: false,
            name: 'Client Name',
            category: 'client',
          ),
          //TODO: add Contact info card [email,phoneNumber/if exists]
          ContactInfoCard(
            phoneGiven: true,
            locationGiven: false,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: 140,
            width: 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                  image: AssetImage("assets/images/wallet.png"),
                  fit: BoxFit.fill),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(230, 90, 10, 10),
              child:
                Text(
                  '$balance\$',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )
            ),
          ),
          //MyWallet(),
          //TODO: add an Appointments card /patient
        ],
      ),
    );
  }
}

enum MenuItem {
  edit_item;
}
