import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_do/db/db_helper.dart';
import 'package:to_do/services/notification_services.dart';
import 'package:to_do/services/theme_services.dart';
import 'package:to_do/ui/pages/home_page.dart';
import 'ui/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //NotificationService().initNotification();
  //NotifyHelper().initializeNotification();
  await DBHelper.initDB();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: ThemeServices().theme,
      home: const HomePage(),
    );
  }
}
