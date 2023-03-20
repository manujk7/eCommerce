abstract class LocalDataStore {
  Future<bool> setBool(String key, bool value);

  Future<bool> setInt(String key, int value);

  Future<bool> setDouble(String key, double value);

  Future<bool> setString(String key, String value);

  Future<bool?> getBool(String key, {bool? defaultValue});

  Future<int?> getInt(String key, {int? defaultValue});

  Future<double?> getDouble(String key, {double? defaultValue});

  Future<String?> getString(String key, {String? defaultValue});
}
