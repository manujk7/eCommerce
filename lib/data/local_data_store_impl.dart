import 'package:e_commerce_app/core/app_export.dart';
import 'package:e_commerce_app/domain/local_data_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataStoreImpl extends LocalDataStore {
  PrefUtils prefUtils;

  LocalDataStoreImpl(this.prefUtils);

  Future<SharedPreferences> get prefs async =>
      await SharedPreferences.getInstance();

  @override
  Future<bool?> getBool(String key, {bool? defaultValue}) async {
    return _getValue<bool>(key, defaultValue, (pref) => pref.getBool(key)!);
  }

  @override
  Future<double?> getDouble(String key, {double? defaultValue}) {
    return _getValue<double>(key, defaultValue, (pref) => pref.getDouble(key)!);
  }

  @override
  Future<int?> getInt(String key, {int? defaultValue}) {
    return _getValue<int>(key, defaultValue, (pref) => pref.getInt(key)!);
  }

  @override
  Future<String?> getString(String key, {String? defaultValue}) {
    return _getValue<String>(key, defaultValue, (pref) => pref.getString(key)!);
  }

  @override
  Future<bool> setBool(String key, bool value) {
    return _setValue((pref) {
      return pref.setBool(key, value);
    });
  }

  @override
  Future<bool> setDouble(String key, double value) {
    return _setValue((pref) {
      return pref.setDouble(key, value);
    });
  }

  @override
  Future<bool> setInt(String key, int value) {
    return _setValue((pref) {
      return pref.setInt(key, value);
    });
  }

  @override
  Future<bool> setString(String key, String value) {
    return _setValue((pref) {
      return pref.setString(key, value);
    });
  }

  Future<T?> _getValue<T>(
      String key, T? defaultValue, T Function(SharedPreferences) function) {
    return prefs.then((pref) {
      if (pref.containsKey(key))
        return function(pref);
      else
        return defaultValue;
    });
  }

  Future<bool> _setValue<T>(Future<bool> Function(SharedPreferences) function) {
    return prefs.then((pref) {
      return function(pref);
    });
  }
}
