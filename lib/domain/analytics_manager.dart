abstract class AnalyticsManager {
  Future<void> init();

  Future<void> addToCommonProperties(Map<String, dynamic> props);

  Future<void> clearCommonProperties();

  Future<void> logout();

  Future<void> addToUserProperties(Map<String, dynamic> props);

  Future<void> logEvent(String eventName, {Map<String, dynamic>? props});


}
