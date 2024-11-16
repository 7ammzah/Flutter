import 'package:flutter/material.dart';
import '../widgets/profile_info_card.dart';

class ExpertisesCard extends StatelessWidget {
  final bool isExpert;
  final List<Widget> children;

  ExpertisesCard({
    super.key,
    required this.children,
    required this.isExpert,
  });

  @override
  Widget build(BuildContext context) {
    return ProfileInfoCard(
        title: 'Expertises',
        isExpertises:
        isExpert
            ?true
            :false,
        children: children);
  }
}

// ListTile(
// textColor: Colors.white,
// title: Text(
// 'an expertise',
// ),
// ),

