import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeServices {
  final GetStorage _getStorage = GetStorage();
  final key = 'isDark';
  bool loadTheme(){ 
    return _getStorage.read<bool>(key) ?? false;
  }
  saveTheme(bool isDarkMode){
    _getStorage.write(key, isDarkMode);
  }
  ThemeMode get theme {
    return loadTheme()?ThemeMode.dark : ThemeMode.light;
  }
  void switchTheme(){
    Get.changeThemeMode(loadTheme()?ThemeMode.light : ThemeMode.dark);
    saveTheme(!loadTheme());
  }
}
