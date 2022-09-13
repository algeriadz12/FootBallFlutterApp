
import 'package:flutter/material.dart';
import 'package:football_app/storage/storage_manager.dart';

class BlackThemeNotifier extends ChangeNotifier {

  static final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    accentColor: Colors.white,
    accentIconTheme: const IconThemeData(color: Colors.black),
    dividerColor: Colors.white,
  );
  static final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: const IconThemeData(color: Colors.white),
    dividerColor: Colors.black54,
  );

  late ThemeData _themeData = lightTheme;
  ThemeData getTheme() => _themeData;

  BlackThemeNotifier(){
    StorageManager.readData().then((value){
      if(value == "dark"){
        _themeData  = darkTheme;
      }
      else if (value == "light"){
        _themeData = lightTheme;
      }
      notifyListeners();
    });

  }

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('dark');
    notifyListeners();
  }
  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('light');
    notifyListeners();
  }
}