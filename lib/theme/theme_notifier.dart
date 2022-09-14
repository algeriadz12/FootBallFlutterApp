
import 'package:flutter/material.dart';
import 'package:football_app/main.dart';
import 'package:football_app/storage/storage_manager.dart';

class AppNotifier extends ChangeNotifier {

  String _lang = language;
  /// THEME SETTINGS

  static final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF16213E),
        selectedLabelStyle: TextStyle(color: Colors.white),
        unselectedLabelStyle: TextStyle(color: Colors.white54)
    ),
    scaffoldBackgroundColor: const Color(0xFF16213E),
    drawerTheme: const DrawerThemeData(backgroundColor: Color(0xFF16213E)),
    accentColor: Colors.white,
    accentIconTheme: const IconThemeData(color: Colors.black),
    dividerColor: Colors.white,
  );

  static final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedLabelStyle: TextStyle(color: Colors.black),
        unselectedLabelStyle: TextStyle(color: Colors.black87)
    ),
    drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor:  const Color(0xFFE5E5E5),
    accentColor: Colors.black,
    accentIconTheme: const IconThemeData(color: Colors.white),
    dividerColor: Colors.black54,
  );

  late ThemeData _themeData = lightTheme;
  ThemeData getTheme() => _themeData;

  AppNotifier(){
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

  /// LANGUAGE SETTINGS

  getLanguage(){
    return _lang;
  }

  setLanguage(String lang){
    _lang = lang;
    notifyListeners();
  }

  // AppTheme
  String appThemeTxt(){
    if(getLanguage() == "EN"){
       return "App Theme";
    }
    return "Theme Application";
  }
  String moreAppTxt(){
    if(getLanguage() == "EN"){
      return 'More Apps';
    }
    return "Plus d'apps";
  }
  String rateUsTxt(){
    if(getLanguage() == "EN"){
       return "Rate Us";
    }
    return "Evaluez App";
  }
  String appLanguage(){
    if(getLanguage() == "EN"){
      return "App Language";
    }
    return "Langue D'application";
  }
  String rankTxt(){
    if(getLanguage() == "EN"){
      return "Rank";
    }
    return "Table";
  }
  String scoreTxt(){
    if(getLanguage() == "EN"){
      return "Score";
    }
    return "En Air";
  }
  String newsTxt(){
    if(getLanguage() == "EN"){
      return "News";
    }
    return "Nouvelles";
  }
  String giveRatingTxt(){
    if(getLanguage() == "EN"){
      return "Give Us A Rating";
    }
    return "Donnez une evaluation";
  }
  String tapTxt(){
    if(getLanguage() == "EN"){
      return "Tap a star to set your rating";
    }
    return "Clickez sur une étoile pour donnez une evaluation";
  }
  String whatDoYouThink(){
    if(getLanguage() == "EN"){
      return "What do you think about our app";
    }
    return "Que pensez vous de notre application";
  }
  String submitTxt(){
    if(getLanguage() == "EN"){
      return "Submit";
    }
    return "Soumettre";
  }
}