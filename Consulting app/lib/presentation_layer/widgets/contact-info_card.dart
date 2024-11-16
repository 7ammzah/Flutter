import 'package:flutter/material.dart';
import 'profile_info_card.dart';
import 'costume_list-tile.dart';

class ContactInfoCard extends StatelessWidget {
  bool phoneGiven;
  bool locationGiven;

  ContactInfoCard({
    this.phoneGiven = false,
    this.locationGiven = false,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileInfoCard(
      title: 'Contact Info',
      isExpertises: false,
      children: [
        const CostumeListTile(
          color: Colors.white,
          iconData: Icons.email_outlined,
          title: "Email Address",
        ),
        phoneGiven
            ? const CostumeListTile(
          color: Colors.white,
          iconData: Icons.phone,
          title: "Phone number",
        )
            : Container(),
        locationGiven
            ? const CostumeListTile(
          color: Colors.white,
          iconData: Icons.location_city_outlined,
          title: "Location",
        )
            : Container(),
      ],
    );
  }
}

