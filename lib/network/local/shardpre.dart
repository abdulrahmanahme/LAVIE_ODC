// ignore_for_file: unnecessary_type_check, unnecessary_question_mark

import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future  setData({
    required SharedKeys key,
    required dynamic? value,
  }) async {
    if (value is int) return await sharedPreferences.setInt(key.name, value);
    if (value is String) return await sharedPreferences.setString(key.name, value);
    if (value is bool) return await sharedPreferences.setBool(key.name, value);
  }

  static getData({
    required SharedKeys key,
  }) {
    return sharedPreferences.get(key.name);
  }

  static Future<bool> removeData({
    required SharedKeys key,
  }) async {
    return await sharedPreferences.remove(key.name);
  }
}

enum SharedKeys {
  firstName,
  lastName,
  email,
  token,
}
