enum Method { POST, GET, PUT, DELETE, PATCH, DOWNLOAD }

typedef T Mapper<T>(Map<String, dynamic> json);
typedef String StringMapper(String responseString);

/// All network data related functionality will happen from here.
abstract class DataService {
  Future<T?> fetchJsonFromNetwork<T>(
    Method method,
    String path, {
    Map<String, dynamic>? queryParameters,
    data,
    required Mapper mapper,
    String? baseUrl,
    String? version,
  });

  Future<List<T>?> fetchListFromNetwork<T>(
    Method method,
    String path, {
    Map<String, dynamic>? queryParameters,
    data,
    required Mapper mapper,
    String? baseUrl,
    String? version,
  });

  Future<String?> redirectionRequest(
    Method method,
    String path, {
    Map<String, dynamic>? queryParameters,
    data,
    required StringMapper mapper,
    String? baseUrl,
    String? version,
  });

  Future<String?> fetchStringFromNetwork(
    Method method,
    String path, {
    Map<String, dynamic>? queryParameters,
    data,
    required StringMapper mapper,
    String? baseUrl,
    String? version,
  });
}
