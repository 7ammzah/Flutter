import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:read_track_ask/services/authentication_with_social.dart';
import 'package:read_track_ask/view/screens/Social_home_screen/home_helper.dart';
import 'package:read_track_ask/view/screens/feed_screen/feed.dart';
import 'package:read_track_ask/view/screens/home_screen.dart';

import '../social_profile/social_profile.dart';

class SocialHome extends StatefulWidget {
  const SocialHome({super.key});

  @override
  State<SocialHome> createState() => _SocialHomeState();
}

class _SocialHomeState extends State<SocialHome> {
  final PageController homePageController = PageController();
  var pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: homePageController,
        children: [
          const HomeScreen(),
          const Feed(),
          SocialProfile(
            userId: Provider.of<AuthenticationWithSocialMediaApp>(context,
                    listen: false)
                .getUserUid,
          ),
        ],
        onPageChanged: (page) {
          setState(() {
            pageIndex = page;
          });
        },
      ),
      bottomNavigationBar: Provider.of<HomeHelper>(context, listen: false)
          .bottomNavBar(context, pageIndex, homePageController),
    );
  }
}
