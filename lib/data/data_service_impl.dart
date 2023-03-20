import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/utils/pref_utils.dart';
import 'package:e_commerce_app/domain/constants/api_routes.dart';
import 'package:e_commerce_app/domain/data_service.dart';

import '../core/constants/constants.dart';
import 'apiClient/api.dart';
import 'apiClient/dio_facade.dart';

class DataServiceImpl extends DataService {
  final DioFacade _dioService;

  DataServiceImpl(
    this._dioService,
    );

  @override
  Future<T?> fetchJsonFromNetwork<T>(
    Method method,
    String path, {
    Map<String, dynamic>? queryParameters,
    data,
    required Mapper mapper,
    String? baseUrl,
    String? version,
  }) async {
    baseUrl ??= ApiConstantKey.kBaseUrl;
    Response<dynamic> response = await _dioService.request(
        url: baseUrl + path,
        method: method,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          responseType: ResponseType.json,
        ));

    var result = response.data;

    if (result is List) {
      throw Exception("Parsing error");
    }

    return mapper(result);
  }

  @override
  Future<List<T>?> fetchListFromNetwork<T>(
    Method method,
    String path, {
    Map<String, dynamic>? queryParameters,
    data,
    required Mapper mapper,
    String? baseUrl,
    String? version,
  }) async {
    baseUrl ??= ApiConstantKey.kBaseUrl;
    Response<dynamic> response = await _dioService.request(
        url: baseUrl + path,
        method: method,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          responseType: ResponseType.json,
        ));

    var result = response.data;
    if (result is! List) {
      throw Exception("Parsing error");
    }

    return (result).map<T>((e) => mapper(e)).toList();
  }

  @override
  Future<String?> redirectionRequest(
    Method method,
    String path, {
    Map<String, dynamic>? queryParameters,
    data,
    required StringMapper mapper,
    String? baseUrl,
    String? version,
  }) async {
    baseUrl ??= Api.baseUrl;
    version ??= ApiVersion.v1;
    Response<dynamic> response = await _dioService.request(
        url: baseUrl + version + path,
        method: method,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          responseType: ResponseType.plain,
          followRedirects: false,
        ));

    var result = response.data;

    return result;
  }

  @override
  Future<String?> fetchStringFromNetwork(
    Method method,
    String path, {
    Map<String, dynamic>? queryParameters,
    data,
    required StringMapper mapper,
    String? baseUrl,
    String? version,
  }) async {
    baseUrl ??= ApiConstantKey.kBaseUrl;

    Response<dynamic> response = await _dioService.request(
        url: baseUrl  + path,
        method: method,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          responseType: ResponseType.plain,
        ));

    var result = response.data;

    return result;
  }
}
