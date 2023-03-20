//ignore: unused_import
import 'dart:convert';

import 'package:e_commerce_app/core/app_export.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'logger.dart';

class PrefUtils {
  static SharedPreferences? _sharedPreferences;

  PrefUtils();

  Future<void> _init() async {
    try {
      _sharedPreferences ??= await SharedPreferences.getInstance();
      Logger.log('SharedPreference Initialized');
    } catch (ex, st) {
      Logger.log('SharedPreference Initialize error, error - $ex',
          stackTrace: st);
    }
  }

  ///will clear all the data stored in preference
  void clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  Future<SharedPreferences> getInstance() async {
    if (_sharedPreferences == null) await _init();
    return _sharedPreferences!;
  }
}
