import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:read_track_ask/services/authentication_with_social.dart';
import 'package:read_track_ask/services/firebase_operations.dart';
import 'package:read_track_ask/view/screens/Social_home_screen/user_profile_helper.dart';
import 'package:read_track_ask/view/screens/feed_screen/feed_helper.dart';
import 'package:read_track_ask/view/screens/feed_screen/post_fuction.dart';
import 'package:read_track_ask/view/screens/feed_screen/upload_post.dart';
import 'package:read_track_ask/view/screens/social_profile/profile_helper.dart';
import 'package:read_track_ask/view/screens/splash_screen.dart';
import 'package:read_track_ask/constants/theme.dart';

import 'view/screens/Social_home_screen/home_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationWithSocialMediaApp>(
            create: (_) => AuthenticationWithSocialMediaApp()),
        ChangeNotifierProvider<FireBaseOpreations>(
            create: (_) => FireBaseOpreations()),
        ChangeNotifierProvider<HomeHelper>(create: (_) => HomeHelper()),
        ChangeNotifierProvider<ProfileHelper>(create: (_) => ProfileHelper()),
        ChangeNotifierProvider<FeedHelper>(create: (_) => FeedHelper()),
        ChangeNotifierProvider<UploadPost>(create: (_) => UploadPost()),
        ChangeNotifierProvider<PostFunctions>(create: (_) => PostFunctions()),
        ChangeNotifierProvider<UserProfileHelper>(
            create: (_) => UserProfileHelper()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RTA',
        theme: ThemeData(
          primarySwatch: beigeMaterialColor,
        ),
        home: const Scaffold(
          body: SplashScreen(),
        ),
      ),
    );
  }
}
