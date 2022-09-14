

import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  static void saveData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("theme", key);
  }

  static Future<String?> readData() async {
    final prefs = await SharedPreferences.getInstance();
    String? obj = prefs.getString("theme");
    return obj;
  }

  static void saveLocalization(String lang) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("language", lang);
  }

}